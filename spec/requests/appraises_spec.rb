require 'rails_helper'

RSpec.describe "Appraises", type: :request do
  describe "GET /appraises" do
    it "works! (now write some real specs)" do
      get appraises_path
      expect(response).to have_http_status(200)
    end
  end
end
