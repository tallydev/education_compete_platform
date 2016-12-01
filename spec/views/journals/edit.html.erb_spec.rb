require 'rails_helper'

RSpec.describe "journals/edit", type: :view do
  before(:each) do
    @journal = assign(:journal, Journal.create!(
      :player => nil,
      :training_course => nil,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit journal form" do
    render

    assert_select "form[action=?][method=?]", journal_path(@journal), "post" do

      assert_select "input#journal_player_id[name=?]", "journal[player_id]"

      assert_select "input#journal_training_course_id[name=?]", "journal[training_course_id]"

      assert_select "input#journal_title[name=?]", "journal[title]"

      assert_select "textarea#journal_content[name=?]", "journal[content]"
    end
  end
end
