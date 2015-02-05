json.array!(@user_assessments) do |user_assessment|
  json.extract! user_assessment, :id, :user_id
  json.url user_assessment_url(user_assessment, format: :json)
end
