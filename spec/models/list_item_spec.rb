require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ListItem do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :list_id => 1,
      :priority => 1
    }
   @list_item = ListItem.new
  end

  it "should create a new instance given valid attributes" do
    ListItem.create!(@valid_attributes)
  end

  it "should always have a title" do
   @list_item.should_not be_valid
   @list_item = ListItem.new(:title=>"test")
   @list_item.should be_valid
  end

  it "it should be invalid if doesnt belong to a list/always belong to a list" do
   @list_item.should_not be_valid
  end
  

end
