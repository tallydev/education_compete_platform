class ChangeAdminIdForManagerFeeedback < ActiveRecord::Migration
  def change
  	change_table :manager_feedbacks do |t|
      t.rename :admin_id, :manager_id
  	end
  end
end
