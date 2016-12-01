require 'rails_helper'

RSpec.describe "player_messages/show", type: :view do
  before(:each) do
    @player_message = assign(:player_message, PlayerMessage.create!(
      :player => nil,
      :message => nil,
      :status => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
