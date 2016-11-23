class CreateResourseVideos < ActiveRecord::Migration
  def change
    create_table :resourse_videos do |t|
      t.string :type
      t.string :video_type
      t.integer :catalog

      t.timestamps null: false
    end
  end
end
