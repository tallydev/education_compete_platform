class AddContentToInfoCompetitionRecruits < ActiveRecord::Migration
  def change
    add_column :info_competition_recruits, :content, :text
  end
end
