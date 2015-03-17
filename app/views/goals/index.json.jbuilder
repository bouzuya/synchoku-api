json.array! @goals do |goal|
  json.extract! goal, :id, :value, :visible
  json.token goal.token if @token
  json.date goal.date.iso8601
end
