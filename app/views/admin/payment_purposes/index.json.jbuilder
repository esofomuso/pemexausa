json.array!(@admin_payment_purposes) do |admin_payment_purpose|
  json.extract! admin_payment_purpose, :id
  json.url admin_payment_purpose_url(admin_payment_purpose, format: :json)
end
