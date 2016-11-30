require 'rails_helper'

RSpec.describe "Admin::TrainingCourses", type: :request do
  describe "GET /admin_training_courses" do
    it "works! (now write some real specs)" do
      get admin_training_courses_path
      expect(response).to have_http_status(200)
    end
  end
end
