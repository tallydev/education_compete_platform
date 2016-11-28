class ChangeColumnUserIdForPlayerFeedback < ActiveRecord::Migration
  def change
  	change_table :player_feedbacks do |t|
      t.rename :user_id, :player_id
  	end
  end
end
