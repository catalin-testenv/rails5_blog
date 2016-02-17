module PagesHelper
  def pages_get_first_content
    Page.first.content
  end
  def pages_magic
    'pages magic here'
  end
end
