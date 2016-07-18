class CreateInfoCompetitionOpuses < ActiveRecord::Migration
  def change
    create_table :info_competition_opuses do |t|
      t.references :recruit, index: true

      t.timestamps null: false
    end
  end
end
