require 'rails_helper'

RSpec.describe "PlayerFeedbacks", type: :request do
  describe "GET /player_feedbacks" do
    it "works! (now write some real specs)" do
      get player_feedbacks_path
      expect(response).to have_http_status(200)
    end
  end
end
