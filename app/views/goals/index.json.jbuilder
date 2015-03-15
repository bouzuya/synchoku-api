json.array! @goals do |goal|
  json.extract! goal, :id, :date, :token, :value, :visible
end
