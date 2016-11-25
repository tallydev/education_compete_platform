require 'rails_helper'

RSpec.describe "appraises/new", type: :view do
  before(:each) do
    assign(:appraise, Appraise.new())
  end

  it "renders new appraise form" do
    render

    assert_select "form[action=?][method=?]", appraises_path, "post" do
    end
  end
end
