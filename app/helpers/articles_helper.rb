module ArticlesHelper
  def articles_get_titles
    Article.all.pluck(:title)
  end
end
