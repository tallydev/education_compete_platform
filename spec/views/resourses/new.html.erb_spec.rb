require 'rails_helper'

RSpec.describe "resourses/new", type: :view do
  before(:each) do
    assign(:resourse, Resourse.new(
      :type => "",
      :resourse_type => "MyString",
      :catalog => 1
    ))
  end

  it "renders new resourse form" do
    render

    assert_select "form[action=?][method=?]", resourses_path, "post" do

      assert_select "input#resourse_type[name=?]", "resourse[type]"

      assert_select "input#resourse_resourse_type[name=?]", "resourse[resourse_type]"

      assert_select "input#resourse_catalog[name=?]", "resourse[catalog]"
    end
  end
end
