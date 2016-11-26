require 'rails_helper'

RSpec.describe "manager_feedbacks/index", type: :view do
  before(:each) do
    assign(:manager_feedbacks, [
      ManagerFeedback.create!(),
      ManagerFeedback.create!()
    ])
  end

  it "renders a list of manager_feedbacks" do
    render
  end
end
