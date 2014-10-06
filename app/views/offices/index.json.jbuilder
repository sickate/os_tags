json.array!(@offices) do |office|
  json.extract! office, :id, :name, :city_id, :group_id
  json.url office_url(office, format: :json)
end
