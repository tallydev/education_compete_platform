json.extract! admin_appraise, :id, :remark, :degree, :created_at, :updated_at
json.player_name admin_appraise.player.try(:name)
json.teacher_name admin_appraise.teacher.try(:name)
json.training_course_name admin_appraise.training_course.try(:name)
