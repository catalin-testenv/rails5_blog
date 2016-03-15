module ListOpsHelper

  def sort_link(column, title = nil)
    column = column.to_s
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc' : 'asc'
    css_class = column == sort_column ? "sort_link_current #{sort_direction}" : nil
    link_to title, {column: column, direction: direction}, {class: css_class}
  end

end
