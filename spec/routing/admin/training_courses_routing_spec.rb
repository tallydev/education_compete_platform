require "rails_helper"

RSpec.describe Admin::TrainingCoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/training_courses").to route_to("admin/training_courses#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/training_courses/new").to route_to("admin/training_courses#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/training_courses/1").to route_to("admin/training_courses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/training_courses/1/edit").to route_to("admin/training_courses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/training_courses").to route_to("admin/training_courses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/training_courses/1").to route_to("admin/training_courses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/training_courses/1").to route_to("admin/training_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/training_courses/1").to route_to("admin/training_courses#destroy", :id => "1")
    end

  end
end
