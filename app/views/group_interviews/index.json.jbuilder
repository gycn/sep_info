json.array!(@group_interviews) do |group_interview|
  json.extract! group_interview, :id
  json.url group_interview_url(group_interview, format: :json)
end
