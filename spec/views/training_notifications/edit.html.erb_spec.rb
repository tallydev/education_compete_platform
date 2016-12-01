require 'rails_helper'

RSpec.describe "training_notifications/edit", type: :view do
  before(:each) do
    @training_notification = assign(:training_notification, TrainingNotification.create!())
  end

  it "renders the edit training_notification form" do
    render

    assert_select "form[action=?][method=?]", training_notification_path(@training_notification), "post" do
    end
  end
end
