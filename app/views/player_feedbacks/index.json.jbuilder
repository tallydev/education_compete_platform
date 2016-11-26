json.current_page @player_feedbacks.current_page
json.total_pages @player_feedbacks.total_pages

json.player_feedbacks @player_feedbacks, partial: 'player_feedbacks/player_feedback', as: :player_feedback