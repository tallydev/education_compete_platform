class CreateTalkCompetitionRecruits < ActiveRecord::Migration
  def change
    create_table :talk_competition_recruits do |t|
      t.references :player, index: true, foreign_key: true
      t.references :school, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
