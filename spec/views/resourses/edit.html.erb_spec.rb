require 'rails_helper'

RSpec.describe "resourses/edit", type: :view do
  before(:each) do
    @resourse = assign(:resourse, Resourse.create!(
      :type => "",
      :resourse_type => "MyString",
      :catalog => 1
    ))
  end

  it "renders the edit resourse form" do
    render

    assert_select "form[action=?][method=?]", resourse_path(@resourse), "post" do

      assert_select "input#resourse_type[name=?]", "resourse[type]"

      assert_select "input#resourse_resourse_type[name=?]", "resourse[resourse_type]"

      assert_select "input#resourse_catalog[name=?]", "resourse[catalog]"
    end
  end
end
