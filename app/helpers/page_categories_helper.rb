module PageCategoriesHelper

  def _current_item_id
    (request.env['PATH_INFO'].split('/')[-1] || Page.root_page.to_param).to_i
  end

  def _sorted_pages_and_categories
    current_item_id = _current_item_id
    page_categories_all = PageCategory.all
    nav_pages = Page.for_main_menu
    # try first to get current_page from nav pages then from non nav pages in case we are viewing a non nav page
    # current_item_id might not even be related to a Page, so current_page might end up being nil
    current_page = (nav_pages.find{ |p| p.id == current_item_id } || Page.find_by_id(current_item_id))

    # mark active items for navigation
    (page_categories_all + (current_page ? [current_page] : [])).reverse_each do |item|
      if item.id == current_item_id
        item.active = true
        current_item_id = item.parent_id
      end
    end

    # we re-sort items to mix ordering between Page and PageCategory (crux for tree build)
    (page_categories_all + nav_pages)
     .sort_by { |item| [item.parent_id.to_i, item.ordering.to_i] }
  end

  def breadcrumbs(all_links = true)
    current_item_id = _current_item_id
    sorted_pages_and_categories = _sorted_pages_and_categories
    non_nav_page = sorted_pages_and_categories.find{ |p| p.id == current_item_id } ? nil : Page.find_by_id(current_item_id)
    non_nav_page && non_nav_page.active = true
    items = (sorted_pages_and_categories + (non_nav_page ? [non_nav_page] : [])).select(&:active)

    html ='<nav aria-label="You are here:" role="navigation"><ul class="breadcrumbs">'

    items
    .map do |item|
      {name: item.name,
       path: if item.is_a?(PageCategory)
               unless all_links
                 category_is_expandable_in_main_nav = (item.has_subcategories? || item.has_nav_pages?)
                 category_is_expandable_in_main_nav ? nil : page_category_path(item)
               else
                 page_category_path(item)
               end
              else
                item.root_page? ? root_path : page_path(item)
              end
      }
    end
    .each.with_index do |item, i|
      if item[:path].nil? || !all_links && i == items.length - 1
        html << "<li>#{item[:name]}</li>"
      else
        html << "<li><a href='#{item[:path]}'>#{item[:name]}</a></li>"
      end
    end

    html << '</ul></nav>'
  end

  def page_categories_all
    PageCategory.all
  end

  # @return Array: array of objects, each object being a tree
  # example [
  #   {name: gallery, link: '/some/path', children: [ # PageCategory
  #       {name: 'photoshop', link: '/some/path', children: []}, # PageCategory
  #       {name: 'illustrator', link: '/some/path', children: []}, # PageCategory
  #       {name: 'other_stuff', link: '/some/path', children: nil} # Page
  #   ]},
  #   {name: 'articles', active: true, link: '/some/path', children: [ # PageCategory
  #       {name: 'movies', active: true, link: '/some/path', children: [ # PageCategory
  #           {name: 'comedy', active: true, link: '/some/path', children: [ # PageCategory
  #               {name: 'black_comedy', active: true, link: '/some/path', children: nil}, # Page
  #               {name: 'white_comedy', link: '/some/path', children: nil} # Page
  #           ]}
  #       ]}
  #   ]}
  # ]
  def page_categories_menu
    ids = {}
    # build tree
    _sorted_pages_and_categories
    .map.with_object([]) do |item, arr|
      # if item is Page let value be its path
      # else (item is a PageCategory) let value be an array
      # - where children (Page || PageCategory) may leave
      obj = {name: item.name, active: item.active,
             link: item.is_a?(PageCategory) ? page_category_path(item) : item.root_page? ? root_path: page_path(item),
             children: item.is_a?(PageCategory) ? [] : nil}
      # if item is PageCategory keep a reference of obj at hand
      # to be able - later - to append obj to its children ([])
      ids[item.id] = obj if item.is_a?(PageCategory)
      if item.parent_id == 0
        # insert in arr only top level items (Page || PageCategory)
        arr << obj
      else
        # insert obj into its parent's children
        # it is assumed the fact that _sorted_pages_and_categories is sorted such as children always come after their parent
        ids[item.parent_id][:children] << obj
      end
    end
  end

  # @return String: nested html ul/li mirroring the 'arr' tree param
  def page_categories_menu_html_foundation_6(arr: page_categories_menu,
                                             options: {},
                                             _count: 0)
    defaults = {wrapper_ul_class: 'dropdown menu',
                wrapper_ul_data: 'data-dropdown-menu',
                inner_ul_class: 'menu',
                inner_ul_data: ''}
    options = defaults.merge options
    html = ''
    return html if arr.length == 0
    html << (_count == 0 ?
        "<ul class='#{options[:wrapper_ul_class]}' #{options[:wrapper_ul_data]}>" :
        "<ul class='#{options[:inner_ul_class]}'   #{options[:inner_ul_data]}>")
    arr.each do |obj|
      name = obj[:name]
      link = obj[:link]
      children = obj[:children]
      active = 'active' if obj[:active]
      if children.nil? || children.length == 0
        # make clickable either a Page either a PageCategory with no nav children
        html << "<li class='#{active}'><a href='#{link}' class='page'>#{name}</a></li>"
      else
        html << "<li class='#{active}'><a href='javascript:void(0);' class='page_category'>#{name}</a>#{page_categories_menu_html_foundation_6(arr: children, options: options, _count: _count+1)}</li>"
      end
    end
    html << '</ul>'
    html
  end

end
