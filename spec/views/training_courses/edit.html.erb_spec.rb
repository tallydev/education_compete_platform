require 'rails_helper'

RSpec.describe "training_courses/edit", type: :view do
  before(:each) do
    @training_course = assign(:training_course, TrainingCourse.create!())
  end

  it "renders the edit training_course form" do
    render

    assert_select "form[action=?][method=?]", training_course_path(@training_course), "post" do
    end
  end
end
