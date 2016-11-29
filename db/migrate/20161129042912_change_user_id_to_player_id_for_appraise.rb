class ChangeUserIdToPlayerIdForAppraise < ActiveRecord::Migration
  def change
  	change_table :appraises do |t|
      t.rename :user_id, :player_id
  	end
  end
end
