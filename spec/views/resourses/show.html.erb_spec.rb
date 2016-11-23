require 'rails_helper'

RSpec.describe "resourses/show", type: :view do
  before(:each) do
    @resourse = assign(:resourse, Resourse.create!(
      :type => "Type",
      :resourse_type => "Resourse Type",
      :catalog => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Resourse Type/)
    expect(rendered).to match(/2/)
  end
end
