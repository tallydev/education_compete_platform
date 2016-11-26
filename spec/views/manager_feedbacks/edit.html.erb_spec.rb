require 'rails_helper'

RSpec.describe "manager_feedbacks/edit", type: :view do
  before(:each) do
    @manager_feedback = assign(:manager_feedback, ManagerFeedback.create!())
  end

  it "renders the edit manager_feedback form" do
    render

    assert_select "form[action=?][method=?]", manager_feedback_path(@manager_feedback), "post" do
    end
  end
end
