module ListOpsHelper

  def list_ops_sort_link(orderby, title = nil)
    qp = request.query_parameters
    orderby = orderby.to_s
    title ||= orderby.titleize
    direction = (orderby == list_ops_sort_orderby && list_ops_sort_direction == 'asc') ? 'desc' : 'asc'
    css_class = orderby == list_ops_sort_orderby ? "sort_link_current #{list_ops_sort_direction}" : nil
    link_to title, qp.merge({orderby: orderby, direction: direction}), {class: [css_class]}
  end

  def list_ops_string(model, column, flt_key)
    qp = request.query_parameters
    content_tag :div, class: %w(uk-form-row) do
      concat label_tag(flt_key, model.human_attribute_name(column).humanize, class: %w(uk-form-label))
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        text_field_tag(flt_key, qp[flt_key], class: %w(uk-width))
      end)
    end
  end

  def list_ops_boolean(model, column, flt_key, yes, no, wildcard)
    qp = request.query_parameters
    content_tag :div, class: %w(uk-form-row) do
      concat label_tag(nil, model.human_attribute_name(column).humanize, class: %w(uk-form-label))
      concat(content_tag(:div, class: %w(uk-grid uk-grid-collapse)) do
        concat(content_tag(:div, class: %w(uk-width-1-3)) do
          concat radio_button_tag(flt_key, '', ['', nil].include?(qp[flt_key]))
          concat label_tag("#{flt_key}_", wildcard, class: %w(uk-width))
        end)
        concat(content_tag(:div, class: %w(uk-width-1-3)) do
          concat radio_button_tag(flt_key, '0', qp[flt_key] == '0')
          concat label_tag("#{flt_key}_0", no, class: %w(uk-width))
        end)
        concat(content_tag(:div, class: %w(uk-width-1-3)) do
          concat radio_button_tag(flt_key, '1', qp[flt_key] == '1')
          concat label_tag("#{flt_key}_1", yes, class: %w(uk-width))
        end)
      end)
    end
  end

  def list_ops_checkbox(model, column, flt_key, html_options={class: 'uk-width'})
    qp = request.query_parameters
    capture do
      concat(hidden_field_tag(flt_key, '0', id: ''))
      concat check_box_tag(flt_key, '1', qp[flt_key] == '1')
      concat label_tag(flt_key, model.human_attribute_name(column), html_options)
    end
  end

  def list_ops_datetime_range(model, column, flt_key, start_key, end_key, start_label, end_label)
    qp = request.query_parameters
    content_tag :div, class: %w(uk-form-row) do
      concat label_tag(flt_key, model.human_attribute_name(column).humanize, class: %w(uk-form-label))
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        content_tag :div, class: %w(uk-grid uk-grid-small) do
          concat(content_tag(:div, class: %w(uk-width-small-1-2)) do
            concat text_field_tag("#{flt_key}[#{start_key}]", qp[flt_key] && qp[flt_key][start_key], class: %w(uk-width), data: {'uk-datepicker' => ''}, placeholder: start_label.humanize)
          end)
          concat(content_tag(:div, class: %w(uk-width-small-1-2)) do
            concat text_field_tag("#{flt_key}[#{end_key}]", qp[flt_key] && qp[flt_key][end_key], class: %w(uk-width), data: {'uk-datepicker' => ''}, placeholder: end_label.humanize)
          end)
        end
      end)
    end
  end

  def list_ops_select(model, column, flt_key, options, html_options={class: 'uk-width'})
    qp = request.query_parameters
    content_tag :div, class: %w(uk-form-row) do
      concat label_tag(flt_key, model.human_attribute_name(column).humanize, class: %w(uk-form-label))
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        select_tag(flt_key, options_for_select(options, :selected => qp[flt_key]), html_options)
      end)
    end
  end

  def list_ops_submit(title, with_fake_label: true, data: {})
    content_tag :div, class: %w(uk-form-row) do
      with_fake_label && concat(label_tag('', '&nbsp;'.html_safe, class: %W(uk-form-label #{with_fake_label})))
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        submit_tag title, class: 'uk-button uk-width', data: data
      end)
    end
  end

end
