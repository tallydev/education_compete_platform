require "rails_helper"

RSpec.describe PlayerFeedbacksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/player_feedbacks").to route_to("player_feedbacks#index")
    end

    it "routes to #new" do
      expect(:get => "/player_feedbacks/new").to route_to("player_feedbacks#new")
    end

    it "routes to #show" do
      expect(:get => "/player_feedbacks/1").to route_to("player_feedbacks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/player_feedbacks/1/edit").to route_to("player_feedbacks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/player_feedbacks").to route_to("player_feedbacks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/player_feedbacks/1").to route_to("player_feedbacks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/player_feedbacks/1").to route_to("player_feedbacks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/player_feedbacks/1").to route_to("player_feedbacks#destroy", :id => "1")
    end

  end
end
