json.current_page @admin_manager_feedbacks.current_page
json.total_pages @admin_manager_feedbacks.total_pages

json.admin_manager_feedbacks @admin_manager_feedbacks, partial: 'admin/manager_feedbacks/admin_manager_feedback', as: :admin_manager_feedback
