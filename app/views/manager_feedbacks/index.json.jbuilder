json.current_page @manager_feedbacks.current_page
json.total_pages @manager_feedbacks.total_pages

json.manager_feedbacks @manager_feedbacks, partial: 'manager_feedbacks/manager_feedback', as: :manager_feedback
bundel 