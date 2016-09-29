json.array!(@taps) do |tap|
  json.extract! tap, :id, :title, :description, :imageId, :tapNumber, :bar_id
  json.url tap_url(tap, format: :json)
end
