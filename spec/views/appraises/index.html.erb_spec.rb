require 'rails_helper'

RSpec.describe "appraises/index", type: :view do
  before(:each) do
    assign(:appraises, [
      Appraise.create!(),
      Appraise.create!()
    ])
  end

  it "renders a list of appraises" do
    render
  end
end
