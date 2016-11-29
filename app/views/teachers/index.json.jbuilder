json.current_page @teachers.current_page
json.total_pages @teachers.total_pages

json.teachers @teachers, partial: 'teachers/teacher', as: :teacher