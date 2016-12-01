require "rails_helper"

RSpec.describe PlayerMessagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/player_messages").to route_to("player_messages#index")
    end

    it "routes to #new" do
      expect(:get => "/player_messages/new").to route_to("player_messages#new")
    end

    it "routes to #show" do
      expect(:get => "/player_messages/1").to route_to("player_messages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/player_messages/1/edit").to route_to("player_messages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/player_messages").to route_to("player_messages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/player_messages/1").to route_to("player_messages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/player_messages/1").to route_to("player_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/player_messages/1").to route_to("player_messages#destroy", :id => "1")
    end

  end
end
