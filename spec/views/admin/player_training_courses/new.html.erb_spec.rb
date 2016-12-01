require 'rails_helper'

RSpec.describe "admin/player_training_courses/new", type: :view do
  before(:each) do
    assign(:admin_player_training_course, Admin::PlayerTrainingCourse.new())
  end

  it "renders new admin_player_training_course form" do
    render

    assert_select "form[action=?][method=?]", admin_player_training_courses_path, "post" do
    end
  end
end
