require "rails_helper"

RSpec.describe PlayerTasksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/player_tasks").to route_to("player_tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/player_tasks/new").to route_to("player_tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/player_tasks/1").to route_to("player_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/player_tasks/1/edit").to route_to("player_tasks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/player_tasks").to route_to("player_tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/player_tasks/1").to route_to("player_tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/player_tasks/1").to route_to("player_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/player_tasks/1").to route_to("player_tasks#destroy", :id => "1")
    end

  end
end
