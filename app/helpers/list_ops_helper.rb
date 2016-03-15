module ListOpsHelper

  def sort_link(orderby, title = nil)
    orderby = orderby.to_s
    title ||= orderby.titleize
    direction = (orderby == list_ops_sort_orderby && list_ops_sort_direction == 'asc') ? 'desc' : 'asc'
    css_class = orderby == list_ops_sort_orderby ? "sort_link_current #{list_ops_sort_direction}" : nil
    link_to title, request.query_parameters.merge({orderby: orderby, direction: direction}), {class: css_class}
  end

end
