json.array!(@articles) do |article|
  json.extract! article, :id, :title
  json.url admin_article_url(article, format: :json)
end
