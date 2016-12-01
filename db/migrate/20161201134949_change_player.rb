class ChangePlayer < ActiveRecord::Migration
  def change
  	change_table :players do |t|
      t.string :name
      t.string :ID_number
      t.boolean :gender, default: true
      t.date :birth
      t.string :school
      t.string :academy
      t.string :certificate
      t.string :city
      t.string :nation
      t.string :position_name
      t.string :position
      t.string :address
      t.string :zip_code
      t.string :telephone
      t.string :email
      t.string :qq_no
      t.text :summary
      t.string :country
      t.text :text
      t.string :profssion
      t.integer :role
  	end
  end
end
