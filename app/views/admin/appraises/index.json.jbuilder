json.array!(@admin_appraises) do |admin_appraise|
  json.extract! admin_appraise, :id
  json.url admin_appraise_url(admin_appraise, format: :json)
end
