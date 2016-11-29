json.current_page @admin_appraises.current_page
json.total_pages @admin_appraises.total_pages

json.admin_appraises @admin_appraises, partial: 'admin/appraises/admin_appraise', as: :admin_appraise
