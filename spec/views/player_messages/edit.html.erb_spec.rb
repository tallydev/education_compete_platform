require 'rails_helper'

RSpec.describe "player_messages/edit", type: :view do
  before(:each) do
    @player_message = assign(:player_message, PlayerMessage.create!(
      :player => nil,
      :message => nil,
      :status => false
    ))
  end

  it "renders the edit player_message form" do
    render

    assert_select "form[action=?][method=?]", player_message_path(@player_message), "post" do

      assert_select "input#player_message_player_id[name=?]", "player_message[player_id]"

      assert_select "input#player_message_message_id[name=?]", "player_message[message_id]"

      assert_select "input#player_message_status[name=?]", "player_message[status]"
    end
  end
end
