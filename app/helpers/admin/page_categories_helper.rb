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
      id = obj[:id]
      name = obj[:name]
      ordering = obj[:ordering]
      parent_id = obj[:parent_id]
      update_delete_path = obj[:update_delete_path]
      children = obj[:children]

      html << content_tag(:li) do
        %Q`
          <div class="uk-button-dropdown uk-dropdown-close" data-uk-dropdown="{mode:'click'}">
              <a class="secondary-link" onclick="event.preventDefault();"><span>#{ordering}: #{name}</span></a>
              <div class="uk-dropdown uk-dropdown-small">
                <ul class="uk-nav uk-nav-dropdown uk-padding-left-remove">
                  <li>#{ link_to "#{icon_edit}&nbsp;&nbsp;#{edit_message}".html_safe, '#update_form', class: 'secondary-link font-weight-normal', data: {'show-edit-form' => 'patch', 'update-delete-path' => update_delete_path, name: name, id: id, ordering: ordering, 'parent-id' => parent_id} }</li>
                  <li>#{ link_to "#{icon_destroy}&nbsp;&nbsp;#{destroy_message}".html_safe, admin_page_category_path(id), class: 'secondary-link font-weight-normal', method: :delete, data: { confirm: are_you_sure_message } }</li>
                </ul>
              </div>
          </div>
          `.html_safe
      end

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
