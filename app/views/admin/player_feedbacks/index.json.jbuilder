json.current_page @admin_player_feedbacks.current_page
json.total_pages @admin_player_feedbacks.total_pages

json.admin_player_feedbacks @admin_player_feedbacks, partial: 'admin/player_feedbacks/admin_player_feedback', as: :admin_player_feedback