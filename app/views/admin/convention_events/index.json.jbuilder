json.array!(@admin_convention_events) do |admin_convention_event|
  json.extract! admin_convention_event, :id
  json.url admin_convention_event_url(admin_convention_event, format: :json)
end
