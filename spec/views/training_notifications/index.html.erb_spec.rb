require 'rails_helper'

RSpec.describe "training_notifications/index", type: :view do
  before(:each) do
    assign(:training_notifications, [
      TrainingNotification.create!(),
      TrainingNotification.create!()
    ])
  end

  it "renders a list of training_notifications" do
    render
  end
end
