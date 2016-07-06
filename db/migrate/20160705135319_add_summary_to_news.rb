class AddSummaryToNews < ActiveRecord::Migration
  def change
    add_column :news, :summary, :text
    add_reference :news, :opu, index: true
  end
end
