class RemoveReferenceFromNews < ActiveRecord::Migration
  def change
    remove_reference :news, :opu
  end
end
