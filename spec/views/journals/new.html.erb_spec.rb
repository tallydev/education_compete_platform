require 'rails_helper'

RSpec.describe "journals/new", type: :view do
  before(:each) do
    assign(:journal, Journal.new(
      :player => nil,
      :training_course => nil,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new journal form" do
    render

    assert_select "form[action=?][method=?]", journals_path, "post" do

      assert_select "input#journal_player_id[name=?]", "journal[player_id]"

      assert_select "input#journal_training_course_id[name=?]", "journal[training_course_id]"

      assert_select "input#journal_title[name=?]", "journal[title]"

      assert_select "textarea#journal_content[name=?]", "journal[content]"
    end
  end
end
