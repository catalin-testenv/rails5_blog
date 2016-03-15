module ListOpsHelper

  def sort_link(orderby, title = nil)
    orderby = orderby.to_s
    title ||= orderby.titleize
    direction = (orderby == sort_orderby && sort_direction == 'asc') ? 'desc' : 'asc'
    css_class = orderby == sort_orderby ? "sort_link_current #{sort_direction}" : nil
    link_to title, request.query_parameters.merge({orderby: orderby, direction: direction}), {class: css_class}
  end

end
