class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :type
      t.string :paper_type
      t.references :paperable, polymorphic: true, index: true

      t.attachment :file
      t.timestamps null: false
    end
  end
end
