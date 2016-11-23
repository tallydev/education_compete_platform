require 'rails_helper'

RSpec.describe "resourses/index", type: :view do
  before(:each) do
    assign(:resourses, [
      Resourse.create!(
        :type => "Type",
        :resourse_type => "Resourse Type",
        :catalog => 2
      ),
      Resourse.create!(
        :type => "Type",
        :resourse_type => "Resourse Type",
        :catalog => 2
      )
    ])
  end

  it "renders a list of resourses" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Resourse Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
