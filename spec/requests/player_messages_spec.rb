require 'rails_helper'

RSpec.describe "PlayerMessages", type: :request do
  describe "GET /player_messages" do
    it "works! (now write some real specs)" do
      get player_messages_path
      expect(response).to have_http_status(200)
    end
  end
end
