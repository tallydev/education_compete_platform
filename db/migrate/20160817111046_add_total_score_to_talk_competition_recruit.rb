class AddTotalScoreToTalkCompetitionRecruit < ActiveRecord::Migration
  def change
  	add_column :talk_competition_recruits, :total_score, :integer, default: 0
  end
end
