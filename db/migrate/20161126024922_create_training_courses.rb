class CreateTrainingCourses < ActiveRecord::Migration
  def change
    create_table :training_courses do |t|
      t.string :name
      t.string :code
      t.datetime :start_time
      t.datetime :end_time
      t.integer :plan_number
      t.string :grade_leader
      t.string :training_agency
      t.string :training_address
      t.decimal :training_fee, precision: 5, scale: 2
      t.string :state
      t.text :remark
      t.string :info
      t.string :training_backgrounds
      t.string :training_target
      t.text :training_content
      t.text :check_method
      t.string :project_leader
      
      t.string :contact
      t.references :school, index: true, foreign_key: true
      t.string :aasm_state
      t.string :category
      t.string :grade_leader
      t.boolean :be_applied
      t.integer :notification_id
      t.datetime :start_apply_time
      t.datetime :end_apply_time
      t.references :admin, index: true, foreign_key: true
      t.string :linkman
      t.string :phone
      t.string :fax
      t.string :mobile
      t.string :email

      t.timestamps null: false
    end
  end
end

