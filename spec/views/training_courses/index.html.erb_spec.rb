require 'rails_helper'

RSpec.describe "training_courses/index", type: :view do
  before(:each) do
    assign(:training_courses, [
      TrainingCourse.create!(),
      TrainingCourse.create!()
    ])
  end

  it "renders a list of training_courses" do
    render
  end
end
