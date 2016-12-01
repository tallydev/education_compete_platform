require 'rails_helper'

RSpec.describe "player_messages/new", type: :view do
  before(:each) do
    assign(:player_message, PlayerMessage.new(
      :player => nil,
      :message => nil,
      :status => false
    ))
  end

  it "renders new player_message form" do
    render

    assert_select "form[action=?][method=?]", player_messages_path, "post" do

      assert_select "input#player_message_player_id[name=?]", "player_message[player_id]"

      assert_select "input#player_message_message_id[name=?]", "player_message[message_id]"

      assert_select "input#player_message_status[name=?]", "player_message[status]"
    end
  end
end
