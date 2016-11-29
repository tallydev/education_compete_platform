json.extract! admin_player_feedback, :id, :teach, :discussion, :visiting, :organization, :study_life, :most_value, :most_gain, :graduate_message, :created_at, :updated_at
json.player_id admin_player_feedback.player.try(:name)
json.training_course_id admin_player_feedback.training_course.try(:name)


 