require 'rails_helper'

RSpec.describe "player_tasks/index", type: :view do
  before(:each) do
    assign(:player_tasks, [
      PlayerTask.create!(
        :title => "Title",
        :content => "MyText",
        :appraise => "Appraise",
        :task => nil,
        :player => nil
      ),
      PlayerTask.create!(
        :title => "Title",
        :content => "MyText",
        :appraise => "Appraise",
        :task => nil,
        :player => nil
      )
    ])
  end

  it "renders a list of player_tasks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Appraise".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
