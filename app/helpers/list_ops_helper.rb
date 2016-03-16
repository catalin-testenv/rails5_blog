module ListOpsHelper

  def list_ops_sort_link(orderby, title = nil)
    orderby = orderby.to_s
    title ||= orderby.titleize
    direction = (orderby == list_ops_sort_orderby && list_ops_sort_direction == 'asc') ? 'desc' : 'asc'
    css_class = orderby == list_ops_sort_orderby ? "sort_link_current #{list_ops_sort_direction}" : nil
    link_to title, request.query_parameters.merge({orderby: orderby, direction: direction}), {class: css_class}
  end

  def list_ops_filter(model, column, flt_key=column)
    col = model.columns.find do |col|
      column.to_s == col.name
    end

    case col.type
    when :string
      capture do
        concat '<div class="uk-form-row">'.html_safe
          concat label_tag(flt_key, model.human_attribute_name(column).humanize, class: 'uk-form-label').html_safe
          concat '<div class="uk-form-controls">'.html_safe
            concat text_field_tag(flt_key, request.query_parameters[flt_key], class: 'uk-width').html_safe
          concat '</div>'.html_safe
        concat '</div>'.html_safe
      end
    when :boolean
      capture do
        concat '<div class="uk-form-row">'.html_safe
          concat label_tag(nil, model.human_attribute_name(column).humanize, class: 'uk-form-label').html_safe
          concat '<div class="uk-grid uk-grid-collapse">'.html_safe

            concat '<div class="uk-width-1-3">'.html_safe
            concat radio_button_tag(flt_key, '', ['', nil].include?(request.query_parameters[flt_key])).html_safe
            concat label_tag("#{flt_key}_", '*', class: 'uk-width').html_safe
            concat '</div>'.html_safe

            concat '<div class="uk-width-1-3">'.html_safe
            concat radio_button_tag(flt_key, '0', request.query_parameters[flt_key] == '0').html_safe
            concat label_tag("#{flt_key}_0", 'no', class: 'uk-width').html_safe
            concat '</div>'.html_safe

            concat '<div class="uk-width-1-3">'.html_safe
            concat radio_button_tag(flt_key, '1', request.query_parameters[flt_key] == '1').html_safe
            concat label_tag("#{flt_key}_1", 'yes', class: 'uk-width').html_safe
            concat '</div>'.html_safe

          concat '</div>'.html_safe
        concat '</div>'.html_safe
      end
    when :datetime
      capture do
        concat '<div class="uk-form-row">'.html_safe
          concat label_tag(flt_key, model.human_attribute_name(column).humanize, class: 'uk-form-label').html_safe
          concat '<div class="uk-form-controls">'.html_safe
            concat '<div class="uk-grid">'.html_safe
              concat '<div class="uk-width-1-2">'.html_safe
                concat text_field_tag("#{flt_key}[starting]", request.query_parameters["#{flt_key}[starting]"], class: 'uk-width', data: {'uk-datepicker' => "{format:'DD.MM.YYYY'}"}).html_safe
              concat '</div>'.html_safe
              concat '<div class="uk-width-1-2">'.html_safe
                concat text_field_tag("#{flt_key}[ending]", request.query_parameters["#{flt_key}[ending]"], class: 'uk-width').html_safe
              concat '</div>'.html_safe
            concat '</div>'.html_safe
          concat '</div>'.html_safe
        concat '</div>'.html_safe
      end
    else
      col.type
    end
  end



end
