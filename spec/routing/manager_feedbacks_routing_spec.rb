require "rails_helper"

RSpec.describe ManagerFeedbacksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manager_feedbacks").to route_to("manager_feedbacks#index")
    end

    it "routes to #new" do
      expect(:get => "/manager_feedbacks/new").to route_to("manager_feedbacks#new")
    end

    it "routes to #show" do
      expect(:get => "/manager_feedbacks/1").to route_to("manager_feedbacks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manager_feedbacks/1/edit").to route_to("manager_feedbacks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manager_feedbacks").to route_to("manager_feedbacks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manager_feedbacks/1").to route_to("manager_feedbacks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manager_feedbacks/1").to route_to("manager_feedbacks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manager_feedbacks/1").to route_to("manager_feedbacks#destroy", :id => "1")
    end

  end
end
