require 'rails_helper'

RSpec.describe "admin/player_training_courses/edit", type: :view do
  before(:each) do
    @admin_player_training_course = assign(:admin_player_training_course, Admin::PlayerTrainingCourse.create!())
  end

  it "renders the edit admin_player_training_course form" do
    render

    assert_select "form[action=?][method=?]", admin_player_training_course_path(@admin_player_training_course), "post" do
    end
  end
end
