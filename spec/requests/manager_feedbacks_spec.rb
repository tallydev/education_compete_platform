require 'rails_helper'

RSpec.describe "ManagerFeedbacks", type: :request do
  describe "GET /manager_feedbacks" do
    it "works! (now write some real specs)" do
      get manager_feedbacks_path
      expect(response).to have_http_status(200)
    end
  end
end
