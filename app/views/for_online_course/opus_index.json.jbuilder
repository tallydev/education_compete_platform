json.page @page
json.per_page @per_page
json.opus @opuses.each do |opus|
	json.(opus, :id, :content)
	json.class opus.class.name
	_class_pr = /(.*)competition::(.*)/.match(opus.class.name.downcase)[1]
	json.show_url "http://114.55.172.35/contest/#{_class_pr}_competition/opuses/#{opus.id}"
end
