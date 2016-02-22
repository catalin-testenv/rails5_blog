module PageCategoriesHelper

  def _sorted_pages_and_categories
    current_item_id = (request.env['PATH_INFO'].split('/')[-1] || Page.root_page.to_param).to_i

    # we re-sort items to mix ordering between Page and PageCategory
    sorted_items = (PageCategory.all + Page.for_main_menu)
                       .sort_by { |item| [item.parent_id.to_i, item.ordering.to_i] }

    # mark active items
    sorted_items.reverse_each do |item|
      if item.id == current_item_id
        item.active = true
        current_item_id = item.parent_id
      end
    end

    sorted_items
  end

  def breadcrumb
    html ='<nav aria-label="You are here:" role="navigation"><ul class="breadcrumbs">'

    _sorted_pages_and_categories
    .select(&:active)
    .map { |item| {name: item.name, path: item.is_a?(PageCategory) ? nil : item.root_page? ? root_path: page_path(item)} }
    .each do |item|
      html << "<li>#{item[:name]}</li>"
    end

    html << '</ul></nav>'
  end

  def page_categories_all
    PageCategory.all
  end

  # @return Array: array of objects, each object being a tree
  # example [
  #   {name: gallery, children: [
  #       {name: 'photoshop', children: []},
  #       {name: 'illustrator', children: []},
  #       {name: 'other_stuff', children: '/some/page'}
  #   ]},
  #   {name: 'articles', active: true, children: [
  #       {name: 'movies', active: true, children: [
  #           {name: 'comedy', active: true, children: [
  #               {name: 'black_comedy', active: true, children: '/some/page'},
  #               {name: 'white_comedy', children: '/some/page'}
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
      obj = {name: item.name, active: item.active, children: item.is_a?(PageCategory) ? [] : item.root_page? ? root_path: page_path(item)}
      # if item is PageCategory keep a reference of obj at hand
      # to be able - later - to append obj to its children ([])
      ids[item.id] = obj if item.is_a?(PageCategory)
      if item.parent_id == 0
        # insert in arr only top level items (Page || PageCategory)
        arr << obj
      else
        # insert obj into its parent_id children
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
    html << (_count == 0 ?
        "<ul class='#{options[:wrapper_ul_class]}' #{options[:wrapper_ul_data]}>" :
        "<ul class='#{options[:inner_ul_class]}'   #{options[:inner_ul_data]}>")
    arr.each do |obj|
      name = obj[:name]
      children = obj[:children]
      active = 'active' if obj[:active]
      if children.is_a? String
        html << "<li class='#{active}'><a href='#{children}' class='page'>#{name}</a></li>"
      else
        html << "<li class='#{active}'><a href='#' class='page_category'>#{name}</a>#{page_categories_menu_html_foundation_6(arr: children, options: options, _count: _count+1)}</li>"
      end
    end
    html << '</ul>'
    html
  end

end
