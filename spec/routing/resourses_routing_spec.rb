require "rails_helper"

RSpec.describe ResoursesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resourses").to route_to("resourses#index")
    end

    it "routes to #new" do
      expect(:get => "/resourses/new").to route_to("resourses#new")
    end

    it "routes to #show" do
      expect(:get => "/resourses/1").to route_to("resourses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resourses/1/edit").to route_to("resourses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resourses").to route_to("resourses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/resourses/1").to route_to("resourses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/resourses/1").to route_to("resourses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resourses/1").to route_to("resourses#destroy", :id => "1")
    end

  end
end
