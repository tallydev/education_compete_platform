class AddSchoolToPlayer < ActiveRecord::Migration
  def change
    add_reference :players, :school, index: true, foreign_key: true
  end
end
