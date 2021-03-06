require 'cucumber/ast/feature_element'

module Cucumber
  module Ast
    class Background
      include FeatureElement
      attr_reader :feature_elements

      def initialize(comment, line, keyword, name, steps)
        @comment, @line, @keyword, @name, @steps = comment, line, keyword, name, StepCollection.new(steps)
        attach_steps(steps)
        @step_invocations = @steps.step_invocations(true)
        @feature_elements = []
      end

      def step_collection(step_invocations)
        unless(@first_collection_created)
          @first_collection_created = true
          @step_invocations.dup(step_invocations)
        else
          @steps.step_invocations(true).dup(step_invocations)
        end
      end

      def accept(visitor)
        visitor.visit_comment(@comment)
        visitor.visit_background_name(@keyword, @name, file_colon_line(@line), source_indent(first_line_length))
        visitor.step_mother.before(hook_context)
        visitor.visit_steps(@step_invocations)
        @failed = @step_invocations.detect{|step_invocation| step_invocation.exception}
        visitor.step_mother.after(hook_context) if @failed
      end

      def accept_hook?(hook)
        if hook_context != self
          hook_context.accept_hook?(hook)
        else
          # We have no scenarios
          false
        end
      end

      def failed?
        @failed
      end

      def hook_context
        @feature_elements.first || self
      end

      def to_sexp
        sexp = [:background, @line, @keyword]
        sexp += [@name] unless @name.empty?
        comment = @comment.to_sexp
        sexp += [comment] if comment
        steps = @steps.to_sexp
        sexp += steps if steps.any?
        sexp
      end
    end
  end
end
