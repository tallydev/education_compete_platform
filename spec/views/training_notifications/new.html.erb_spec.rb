require 'rails_helper'

RSpec.describe "training_notifications/new", type: :view do
  before(:each) do
    assign(:training_notification, TrainingNotification.new())
  end

  it "renders new training_notification form" do
    render

    assert_select "form[action=?][method=?]", training_notifications_path, "post" do
    end
  end
end
