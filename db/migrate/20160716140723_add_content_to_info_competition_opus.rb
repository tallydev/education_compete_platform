class AddContentToInfoCompetitionOpus < ActiveRecord::Migration
  def change
    add_column :info_competition_opuses, :content, :string
  end
end
