json.current_page @admin_training_courses.current_page
json.total_pages @admin_training_courses.total_pages

json.admin_training_courses @admin_training_courses, partial: 'admin/training_courses/admin_training_course', as: :admin_training_course