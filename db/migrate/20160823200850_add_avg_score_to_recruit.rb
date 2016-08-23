class AddAvgScoreToRecruit < ActiveRecord::Migration
  def change
    add_column :info_competition_recruits, :avg_score, :float
    add_column :info_competition_recruits, :score_count, :integer
    add_column :talk_competition_recruits, :avg_score, :float
    add_column :talk_competition_recruits, :score_count, :integer
  end
end
