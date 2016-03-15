module ListOpsHelper

  def list_ops_sort_link(orderby, title = nil)
    orderby = orderby.to_s
    title ||= orderby.titleize
    direction = (orderby == list_ops_sort_orderby && list_ops_sort_direction == 'asc') ? 'desc' : 'asc'
    css_class = orderby == list_ops_sort_orderby ? "sort_link_current #{list_ops_sort_direction}" : nil
    link_to title, request.query_parameters.merge({orderby: orderby, direction: direction}), {class: css_class}
  end

  def list_ops_filter(column, model, key)
    col = model.columns.find do |col|
      column.to_s == col.name
    end

    case col.type
      when :string
        %Q`<input type="text" name="#{key}" />`.html_safe
      when :integer
        'integer'
    end
  end



end
