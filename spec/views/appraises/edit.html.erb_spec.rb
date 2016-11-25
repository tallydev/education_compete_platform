require 'rails_helper'

RSpec.describe "appraises/edit", type: :view do
  before(:each) do
    @appraise = assign(:appraise, Appraise.create!())
  end

  it "renders the edit appraise form" do
    render

    assert_select "form[action=?][method=?]", appraise_path(@appraise), "post" do
    end
  end
end
