require 'rails_helper'

RSpec.describe "admin/training_courses/edit", type: :view do
  before(:each) do
    @admin_training_course = assign(:admin_training_course, Admin::TrainingCourse.create!())
  end

  it "renders the edit admin_training_course form" do
    render

    assert_select "form[action=?][method=?]", admin_training_course_path(@admin_training_course), "post" do
    end
  end
end
