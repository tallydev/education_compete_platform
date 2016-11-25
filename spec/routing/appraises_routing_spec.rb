require "rails_helper"

RSpec.describe AppraisesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/appraises").to route_to("appraises#index")
    end

    it "routes to #new" do
      expect(:get => "/appraises/new").to route_to("appraises#new")
    end

    it "routes to #show" do
      expect(:get => "/appraises/1").to route_to("appraises#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/appraises/1/edit").to route_to("appraises#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/appraises").to route_to("appraises#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/appraises/1").to route_to("appraises#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/appraises/1").to route_to("appraises#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/appraises/1").to route_to("appraises#destroy", :id => "1")
    end

  end
end
