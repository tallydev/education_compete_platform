require 'rails_helper'

RSpec.describe "ResourceLibraries", type: :request do
  describe "GET /resource_libraries" do
    it "works! (now write some real specs)" do
      get resource_libraries_path
      expect(response).to have_http_status(200)
    end
  end
end
