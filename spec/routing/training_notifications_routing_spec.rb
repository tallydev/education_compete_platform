require "rails_helper"

RSpec.describe TrainingNotificationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/training_notifications").to route_to("training_notifications#index")
    end

    it "routes to #new" do
      expect(:get => "/training_notifications/new").to route_to("training_notifications#new")
    end

    it "routes to #show" do
      expect(:get => "/training_notifications/1").to route_to("training_notifications#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/training_notifications/1/edit").to route_to("training_notifications#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/training_notifications").to route_to("training_notifications#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/training_notifications/1").to route_to("training_notifications#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/training_notifications/1").to route_to("training_notifications#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/training_notifications/1").to route_to("training_notifications#destroy", :id => "1")
    end

  end
end
