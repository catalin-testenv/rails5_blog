module PageCategoriesHelper

  def page_categories_all
    PageCategory.all
  end

  def page_categories_menu
    # we re-sort items to mix ordering between Page and PageCategory
    ids = {}
    (PageCategory.all + Page.for_main_menu)
    .sort_by { |item| [item.parent_id.to_i, item.ordering.to_i] }
    .map.with_object([]) do |item, arr|
      # if item is Page let value be its path
      # else (item is a PageCategory) let value be an array
      # - where children (Page || PageCategory) may leave
      obj = {item.name => item.is_a?(PageCategory) ? [] : item.root_page? ? root_path: page_path(item)}
      # if item is PageCategory keep a reference of obj at hand
      # to be able - later - to append obj to its children ([])
      ids[item.id] = obj if item.is_a?(PageCategory)
      if item.parent_id == 0
        # insert in arr only top level items (Page || PageCategory)
        arr << obj
      else
        # insert obj into its parent_id children
        ids[item.parent_id].values[0] << obj
      end
    end
=begin
    # example return
    [
      {gallery: [
        {photoshop: []},
        {illustrator: []},
        {other_stuff: '/some/page'}
      ]},
      {articles: [
        {movies: [
          {comedy: [
            {black_comedy: '/some/page'},
            {white_comedy: '/some/page'}
          ]}
        ]}
      ]}
    ]
=end
  end

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
      name = obj.keys[0]
      children = obj[name]
      if children.is_a? String
        html << "<li><a href='#{children}' class='page'>#{name}</a></li>"
      else
        html << "<li><a href='#' class='page_category'>#{name}</a>#{page_categories_menu_html_foundation_6(arr: children, options: options, _count: _count+1)}</li>"
      end
    end
    html << '</ul>'
    html
  end

end
