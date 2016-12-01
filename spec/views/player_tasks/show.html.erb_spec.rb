require 'rails_helper'

RSpec.describe "player_tasks/show", type: :view do
  before(:each) do
    @player_task = assign(:player_task, PlayerTask.create!(
      :title => "Title",
      :content => "MyText",
      :appraise => "Appraise",
      :task => nil,
      :player => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Appraise/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
