module Admin::PageCategoriesHelper

  def page_categories_tree
    ids = {}
    @resource_list.map.with_object([]) do |item, arr|
      obj = {
          id: item.id,
          name: item.name,
          ordering: item.ordering,
          parent_id: item.parent_id,
          update_delete_path: admin_page_category_path(item),
          children: []}

      ids[item.id] = obj
      if item.parent_id == 0
        arr << obj
      else
        ids[item.parent_id][:children] << obj
      end
    end
  end

  def page_categories_html(arr: page_categories_tree, _count: 0)
    html = ''
    return html if arr.length == 0
    html << (_count == 0 ? "<ul class='uk-list'>" : "<ul class=''>")

    arr.each do |obj|
      name = obj[:name]
      ordering = obj[:ordering]
      parent_id = obj[:parent_id]
      update_delete_path = obj[:update_delete_path]
      children = obj[:children]

      html << form_dialog_editable_li_as_dropdown("#{ordering}: #{name}", '#edit_form', update_delete_path, PageCategory.name.underscore, {'name' => name, 'ordering' => ordering, 'parent-id' => parent_id})

      unless children.nil? || children.length == 0
        html << content_tag(:li) do
          concat(page_categories_html(arr: children, _count: _count+1).html_safe)
        end
      end
    end

    html << '</ul>'
    html

  end

end
