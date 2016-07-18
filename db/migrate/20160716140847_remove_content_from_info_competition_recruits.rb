class RemoveContentFromInfoCompetitionRecruits < ActiveRecord::Migration
  def change
    remove_column :info_competition_recruits, :content, :text
  end
end
