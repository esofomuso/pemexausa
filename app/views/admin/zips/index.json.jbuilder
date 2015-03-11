json.array!(@admin_zips) do |admin_zip|
  json.extract! admin_zip, :id
  json.url admin_zip_url(admin_zip, format: :json)
end
