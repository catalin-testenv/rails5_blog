module TagsHelper

  def tags_menu
    content_tag(:ul, class: %w(tags-menu-list)) do
      Tag.all.map do |tag|
        content_tag(:li, class: current_item_id == tag.id ? 'active' : '') do
          link_to tag.name, tag_path(tag)
        end
      end.join("\n").html_safe
    end
  end

end
