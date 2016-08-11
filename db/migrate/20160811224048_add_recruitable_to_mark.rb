class AddRecruitableToMark < ActiveRecord::Migration
  def change
    add_reference :marks, :recruitable, polymorphic: true, index: true
  end
end
