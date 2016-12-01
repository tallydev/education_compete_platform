require 'rails_helper'

RSpec.describe "journals/show", type: :view do
  before(:each) do
    @journal = assign(:journal, Journal.create!(
      :player => nil,
      :training_course => nil,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
