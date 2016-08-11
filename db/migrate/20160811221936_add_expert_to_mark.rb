class AddExpertToMark < ActiveRecord::Migration
  def change
    add_reference :marks, :expert, index: true
  end
end
