json.array!(@questions) do |question|
  json.extract! question, :id, :description, :category
  json.url question_url(question, format: :json)
end
