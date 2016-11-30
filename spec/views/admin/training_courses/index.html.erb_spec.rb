require 'rails_helper'

RSpec.describe "admin/training_courses/index", type: :view do
  before(:each) do
    assign(:admin_training_courses, [
      Admin::TrainingCourse.create!(),
      Admin::TrainingCourse.create!()
    ])
  end

  it "renders a list of admin/training_courses" do
    render
  end
end
