json.array!(@bars) do |bar|
  json.extract! bar, :id, :title
  json.url bar_url(bar, format: :json)
end
