require 'rails_helper'

RSpec.describe "Resourses", type: :request do
  describe "GET /resourses" do
    it "works! (now write some real specs)" do
      get resourses_path
      expect(response).to have_http_status(200)
    end
  end
end
