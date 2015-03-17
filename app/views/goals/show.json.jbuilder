json.extract! @goal, :id, :date, :value, :visible
json.token @goal.token if @token
json.date @goal.date.iso8601
