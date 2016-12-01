require 'rails_helper'

RSpec.describe "journals/index", type: :view do
  before(:each) do
    assign(:journals, [
      Journal.create!(
        :player => nil,
        :training_course => nil,
        :title => "Title",
        :content => "MyText"
      ),
      Journal.create!(
        :player => nil,
        :training_course => nil,
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of journals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
