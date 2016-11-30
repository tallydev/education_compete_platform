class AddAuthenticationTokenToMananger < ActiveRecord::Migration
  def change
  	add_column :managers, :authentication_token, :string, limit: 30
    add_index :managers, :authentication_token, unique: true
  end
end
