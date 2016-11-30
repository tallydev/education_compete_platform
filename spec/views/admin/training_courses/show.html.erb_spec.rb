require 'rails_helper'

RSpec.describe "admin/training_courses/show", type: :view do
  before(:each) do
    @admin_training_course = assign(:admin_training_course, Admin::TrainingCourse.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
