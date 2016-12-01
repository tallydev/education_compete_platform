json.extract! player_training_course, :id, :remark, :certificate_no, :created_at, :updated_at
json.player_name player_training_course.player_id
json.training_course_name player_training_course.training_course_id