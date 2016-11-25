json.array!(@appraises) do |appraise|
  json.extract! appraise, :id
  json.url appraise_url(appraise, format: :json)
end
