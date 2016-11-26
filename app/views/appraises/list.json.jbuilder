json.current_page @appraises.current_page
json.total_pages @appraises.total_pages

json.appraises @appraises, partial: 'appraises/appraise', as: :appraise
