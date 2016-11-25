require 'rails_helper'

RSpec.describe "player_feedbacks/new", type: :view do
  before(:each) do
    assign(:player_feedback, PlayerFeedback.new())
  end

  it "renders new player_feedback form" do
    render

    assert_select "form[action=?][method=?]", player_feedbacks_path, "post" do
    end
  end
end
