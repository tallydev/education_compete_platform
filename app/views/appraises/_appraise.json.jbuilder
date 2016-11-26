json.id @appraise.id
json.user_id @appraise.user_id
json.teacher_id @appraise.teacher_id
json.remark @appraise.remark
json.degree @appraise.degree
json.training_course_id @appraise.training_course_id
json.extract! @appraise, :created_at, :updated_at
