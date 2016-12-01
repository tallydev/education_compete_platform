require 'rails_helper'

RSpec.describe "admin/player_training_courses/show", type: :view do
  before(:each) do
    @admin_player_training_course = assign(:admin_player_training_course, Admin::PlayerTrainingCourse.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
