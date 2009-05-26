# == Schema Information
# Schema version: 20090525203200
#
# Table name: list_items
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  list_id    :integer(4)
#  priority   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class ListItem < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :list
  validates_associated :list
end
