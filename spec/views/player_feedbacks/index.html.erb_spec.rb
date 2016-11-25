require 'rails_helper'

RSpec.describe "player_feedbacks/index", type: :view do
  before(:each) do
    assign(:player_feedbacks, [
      PlayerFeedback.create!(),
      PlayerFeedback.create!()
    ])
  end

  it "renders a list of player_feedbacks" do
    render
  end
end
