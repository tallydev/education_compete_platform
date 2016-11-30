require 'rails_helper'

RSpec.describe "admin/training_courses/new", type: :view do
  before(:each) do
    assign(:admin_training_course, Admin::TrainingCourse.new())
  end

  it "renders new admin_training_course form" do
    render

    assert_select "form[action=?][method=?]", admin_training_courses_path, "post" do
    end
  end
end
