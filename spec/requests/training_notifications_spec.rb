require 'rails_helper'

RSpec.describe "TrainingNotifications", type: :request do
  describe "GET /training_notifications" do
    it "works! (now write some real specs)" do
      get training_notifications_path
      expect(response).to have_http_status(200)
    end
  end
end
