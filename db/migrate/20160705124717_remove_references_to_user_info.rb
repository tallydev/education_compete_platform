class RemoveReferencesToUserInfo < ActiveRecord::Migration
  def change
    remove_reference :user_infos, :player
    add_reference :user_infos, :user
  end
end
