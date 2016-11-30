json.current_page @training_courses.current_page
json.total_pages @training_courses.total_pages

json.training_courses @training_courses, partial: 'training_courses/training_course', as: :training_course