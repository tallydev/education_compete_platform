class RemoveRecruitFromMark < ActiveRecord::Migration
  def change
    remove_reference :marks, :recruit, index: true
  end
end
