json.array! @marks do |mark|
  json.extract! mark, :id, :goal_id, :value
  json.date mark.date.iso8601
end
