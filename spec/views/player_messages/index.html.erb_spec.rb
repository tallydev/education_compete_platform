require 'rails_helper'

RSpec.describe "player_messages/index", type: :view do
  before(:each) do
    assign(:player_messages, [
      PlayerMessage.create!(
        :player => nil,
        :message => nil,
        :status => false
      ),
      PlayerMessage.create!(
        :player => nil,
        :message => nil,
        :status => false
      )
    ])
  end

  it "renders a list of player_messages" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
