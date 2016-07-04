class AddReferenceSchoolToUser < ActiveRecord::Migration
  def change
    add_reference :users, :schools, index: true
  end
end
