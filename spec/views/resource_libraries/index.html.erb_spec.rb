require 'rails_helper'

RSpec.describe "resource_libraries/index", type: :view do
  before(:each) do
    assign(:resource_libraries, [
      ResourceLibrary.create!(
        :title => "Title",
        :catalog => 2,
        :mdate => "Mdate"
      ),
      ResourceLibrary.create!(
        :title => "Title",
        :catalog => 2,
        :mdate => "Mdate"
      )
    ])
  end

  it "renders a list of resource_libraries" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Mdate".to_s, :count => 2
  end
end
