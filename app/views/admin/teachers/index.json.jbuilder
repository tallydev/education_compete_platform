json.current_page @admin_teachers.current_page
json.total_pages @admin_teachers.total_pages

json.admin_teachers @admin_teachers, partial: 'admin/teachers/admin_teacher', as: :admin_teacher