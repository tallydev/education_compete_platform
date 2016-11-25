require 'rails_helper'

RSpec.describe "manager_feedbacks/new", type: :view do
  before(:each) do
    assign(:manager_feedback, ManagerFeedback.new())
  end

  it "renders new manager_feedback form" do
    render

    assert_select "form[action=?][method=?]", manager_feedbacks_path, "post" do
    end
  end
end
