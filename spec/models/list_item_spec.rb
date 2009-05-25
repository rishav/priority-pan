require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListItem do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :list_id => 1,
      :priority => 1
    }
  end

  it "should create a new instance given valid attributes" do
    ListItem.create!(@valid_attributes)
  end
end
