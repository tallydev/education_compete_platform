require 'rails_helper'

RSpec.describe "resource_libraries/edit", type: :view do
  before(:each) do
    @resource_library = assign(:resource_library, ResourceLibrary.create!(
      :title => "MyString",
      :catalog => 1,
      :mdate => "MyString"
    ))
  end

  it "renders the edit resource_library form" do
    render

    assert_select "form[action=?][method=?]", resource_library_path(@resource_library), "post" do

      assert_select "input#resource_library_title[name=?]", "resource_library[title]"

      assert_select "input#resource_library_catalog[name=?]", "resource_library[catalog]"

      assert_select "input#resource_library_mdate[name=?]", "resource_library[mdate]"
    end
  end
end
