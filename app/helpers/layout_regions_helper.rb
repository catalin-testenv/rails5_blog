module LayoutRegionsHelper

  # TODO: fake
  def get_content_for(region)
      "<div>content for #{region}: #{some_helper}</div>".html_safe
  end

  # TODO: fake
  def some_helper
    breadcrumb
  end

end
