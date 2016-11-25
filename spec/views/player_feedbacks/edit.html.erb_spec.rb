require 'rails_helper'

RSpec.describe "player_feedbacks/edit", type: :view do
  before(:each) do
    @player_feedback = assign(:player_feedback, PlayerFeedback.create!())
  end

  it "renders the edit player_feedback form" do
    render

    assert_select "form[action=?][method=?]", player_feedback_path(@player_feedback), "post" do
    end
  end
end
