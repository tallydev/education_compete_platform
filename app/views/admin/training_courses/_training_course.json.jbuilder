json.extract! admin_training_course, :id, :name, :code, :start_time, :end_time, :plan_number, :training_address, :training_fee, :state, 
                       :remark, :info, :training_backgrounds, :training_target, :training_content, :check_method, :project_leader, :contact,
			           :aasm_state, :category, :grade_leader, :be_applied, :start_apply_time, :end_apply_time, :linkman, :phone,
			           :fax, :mobile, :email, :created_at, :updated_at
# json.admin_name admin_training_course.admin_id
# json.notification_name admin_training_course.notification_id
json.school_name admin_training_course.school.try(:name)
