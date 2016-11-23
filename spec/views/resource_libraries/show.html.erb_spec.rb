require 'rails_helper'

RSpec.describe "resource_libraries/show", type: :view do
  before(:each) do
    @resource_library = assign(:resource_library, ResourceLibrary.create!(
      :title => "Title",
      :catalog => 2,
      :mdate => "Mdate"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Mdate/)
  end
end
