require "rails_helper"

RSpec.describe ResourceLibrariesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resource_libraries").to route_to("resource_libraries#index")
    end

    it "routes to #new" do
      expect(:get => "/resource_libraries/new").to route_to("resource_libraries#new")
    end

    it "routes to #show" do
      expect(:get => "/resource_libraries/1").to route_to("resource_libraries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resource_libraries/1/edit").to route_to("resource_libraries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resource_libraries").to route_to("resource_libraries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/resource_libraries/1").to route_to("resource_libraries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/resource_libraries/1").to route_to("resource_libraries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resource_libraries/1").to route_to("resource_libraries#destroy", :id => "1")
    end

  end
end
