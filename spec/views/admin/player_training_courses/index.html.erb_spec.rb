require 'rails_helper'

RSpec.describe "admin/player_training_courses/index", type: :view do
  before(:each) do
    assign(:admin_player_training_courses, [
      Admin::PlayerTrainingCourse.create!(),
      Admin::PlayerTrainingCourse.create!()
    ])
  end

  it "renders a list of admin/player_training_courses" do
    render
  end
end
