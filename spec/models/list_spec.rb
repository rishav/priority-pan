require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe List do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    List.create!(@valid_attributes)
  end
end

describe List do
  before :each do 
    @list = List.new
  end

  it "should be invalid without a title" do 
    @list.should_not be_valid
  end

  it "should be invalid without a user_id" do 
    @list.should_not be_valid
  end
 
  it "should always belong to a user" do 
    @list.should_not be_valid
    @list.user_id = 1
    @list.title="Value"
    @list.should be_valid	
  end
 
  it "should have zero or more Listitems" do
    @list.should have_at_least(0).list_items
  end

end

