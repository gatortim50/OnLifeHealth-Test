json.array!(@uploads) do |upload|
  json.extract! upload, :id, :name, :attachment
  json.url upload_url(upload, format: :json)
end
