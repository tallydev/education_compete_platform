require 'rails_helper'

RSpec.describe "player_tasks/edit", type: :view do
  before(:each) do
    @player_task = assign(:player_task, PlayerTask.create!(
      :title => "MyString",
      :content => "MyText",
      :appraise => "MyString",
      :task => nil,
      :player => nil
    ))
  end

  it "renders the edit player_task form" do
    render

    assert_select "form[action=?][method=?]", player_task_path(@player_task), "post" do

      assert_select "input#player_task_title[name=?]", "player_task[title]"

      assert_select "textarea#player_task_content[name=?]", "player_task[content]"

      assert_select "input#player_task_appraise[name=?]", "player_task[appraise]"

      assert_select "input#player_task_task_id[name=?]", "player_task[task_id]"

      assert_select "input#player_task_player_id[name=?]", "player_task[player_id]"
    end
  end
end
