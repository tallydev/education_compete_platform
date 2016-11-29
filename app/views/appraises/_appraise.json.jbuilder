json.extract! appraise, :id, :remark, :degree, :created_at, :updated_at
json.player_id appraise.player.try(:name)
json.teacher_id appraise.teacher.try(:name)
json.training_course_id appraise.training_course.try(:name)
