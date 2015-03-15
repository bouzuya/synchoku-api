json.array! @goals do |goal|
  json.extract! goal, :id, :token, :value, :visible
  json.date goal.date.iso8601
end
