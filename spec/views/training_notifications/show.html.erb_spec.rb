require 'rails_helper'

RSpec.describe "training_notifications/show", type: :view do
  before(:each) do
    @training_notification = assign(:training_notification, TrainingNotification.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
