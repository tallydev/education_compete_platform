require 'rails_helper'

RSpec.describe "player_feedbacks/show", type: :view do
  before(:each) do
    @player_feedback = assign(:player_feedback, PlayerFeedback.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
