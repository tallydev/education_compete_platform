class AddWorkTimeToTalkCompetitionRecruit < ActiveRecord::Migration
  def change
    add_column :talk_competition_recruits, :name, :string
    add_column :talk_competition_recruits, :comment, :text
    add_column :talk_competition_recruits, :work_time, :string
  end
end
