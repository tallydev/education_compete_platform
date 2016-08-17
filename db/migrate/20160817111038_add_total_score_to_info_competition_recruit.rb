class AddTotalScoreToInfoCompetitionRecruit < ActiveRecord::Migration
  def change
  	add_column :info_competition_recruits, :total_score, :integer, default: 0
  end
end
