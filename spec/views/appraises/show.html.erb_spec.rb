require 'rails_helper'

RSpec.describe "appraises/show", type: :view do
  before(:each) do
    @appraise = assign(:appraise, Appraise.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
