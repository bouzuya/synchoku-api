json.extract! @goal, :id, :date, :token, :value, :visible
json.date @goal.date.iso8601
