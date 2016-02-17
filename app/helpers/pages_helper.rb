module PagesHelper
  def pages_for_main_menu
    Page.for_main_menu.map do |page|
      {title: page.title, path: page.root_page? ? root_path : page_path(page)}
    end
  end
end
