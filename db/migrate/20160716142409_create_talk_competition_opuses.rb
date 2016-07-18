class CreateTalkCompetitionOpuses < ActiveRecord::Migration
  def change
    create_table :talk_competition_opuses do |t|
      t.string :content
      t.references :recruit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
