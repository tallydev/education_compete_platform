class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
    	t.references :recruitable, polymorphic: true
    	t.references :expert
    	
      t.timestamps null: false
    end
  end
end
