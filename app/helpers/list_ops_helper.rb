module ListOpsHelper

  def list_ops_sort_link(orderby, title = nil)
    qp = request.query_parameters
    orderby = orderby.to_s
    title ||= orderby.titleize
    direction = (orderby == list_ops_sort_orderby && list_ops_sort_direction == 'asc') ? 'desc' : 'asc'
    css_class = orderby == list_ops_sort_orderby ? "sort_link_current #{list_ops_sort_direction}" : nil
    link_to title, qp.merge({orderby: orderby, direction: direction}), {class: [css_class]}
  end

  def list_ops_with_label(model, column, input_name, icon)
    content_tag :div, class: %w(uk-form-row) do
      concat(list_ops_label(model, column, input_name, icon))
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        yield if block_given?
      end)
    end
  end

  def list_ops_label(model, column, input_name, icon, html_options={class: %w(uk-form-label)})
    label_tag(input_name, **html_options) do
      if icon.present?
        icon + '&nbsp;&nbsp;'.html_safe + model.human_attribute_name(column).humanize
      else
        model.human_attribute_name(column).humanize
      end
    end
  end

  def list_ops_label_span(model, column, icon, html_options={class: %w(uk-form-label)})
    content_tag(:span, **html_options) do
      if icon.present?
        icon + '&nbsp;&nbsp;'.html_safe + model.human_attribute_name(column).humanize
      else
        model.human_attribute_name(column).humanize
      end
    end
  end

  def list_ops_string(model, column, input_name, icon, text_field_options={})
    qp = request.query_parameters
    list_ops_with_label(model, column, input_name, icon) do
      text_field_tag(input_name, qp[input_name], class: %w(uk-width), **text_field_options)
    end
  end

  def list_ops_boolean(model, column, input_name, icon, yes, no, wildcard)
    qp = request.query_parameters
    content_tag :div, class: %w(uk-form-row) do
      concat(list_ops_label(model, column, input_name, icon))
      concat(content_tag(:div, class: %w(uk-grid uk-grid-collapse)) do
        concat(content_tag(:div, class: %w(uk-width-1-3)) do
          concat radio_button_tag(input_name, '', ['', nil].include?(qp[input_name]))
          concat label_tag("#{input_name}_", wildcard, class: %w(uk-width))
        end)
        concat(content_tag(:div, class: %w(uk-width-1-3)) do
          concat radio_button_tag(input_name, '0', qp[input_name] == '0')
          concat label_tag("#{input_name}_0", no, class: %w(uk-width))
        end)
        concat(content_tag(:div, class: %w(uk-width-1-3)) do
          concat radio_button_tag(input_name, '1', qp[input_name] == '1')
          concat label_tag("#{input_name}_1", yes, class: %w(uk-width))
        end)
      end)
    end
  end

  def list_ops_checkbox(model, column, input_name, icon, html_options={class: 'uk-width'})
    qp = request.query_parameters
    capture do
      concat(hidden_field_tag(input_name, '0', id: ''))
      concat check_box_tag(input_name, '1', qp[input_name] == '1')
      concat(list_ops_label(model, column, input_name, icon, html_options))
    end
  end

  def list_ops_radio(model, column, input_name, icon, values)
    qp = request.query_parameters
    cols = (1..6) === values.length ? values.length : 10
    content_tag :div, class: %w(uk-form-row) do
      concat(list_ops_label_span(model, column, icon))
      concat(content_tag(:div, class: %w(uk-grid uk-grid-collapse)) do
        values.each { |key, value|
          concat(content_tag(:div, class: %W(uk-width-1-#{cols})) do
            concat radio_button_tag(input_name, key, (qp[input_name] || '') == key)
            concat label_tag("#{input_name}_#{key}", value, class: %w(uk-width))
          end)
        }
      end)
    end
  end

  def list_ops_datetime_range(model, column, input_name, icon,  start_key, end_key, start_label, end_label)
    qp = request.query_parameters
    list_ops_with_label(model, column, "#{input_name}[#{start_key}]", icon) do
      content_tag :div, class: %w(uk-grid uk-grid-small) do
        concat(content_tag(:div, class: %w(uk-width-small-1-2)) do
          concat text_field_tag("#{input_name}[#{start_key}]", qp[input_name] && qp[input_name][start_key], class: %w(uk-width), data: {'uk-datepicker' => ''}, placeholder: start_label.humanize)
        end)
        concat(content_tag(:div, class: %w(uk-width-small-1-2)) do
          concat text_field_tag("#{input_name}[#{end_key}]", qp[input_name] && qp[input_name][end_key], class: %w(uk-width), data: {'uk-datepicker' => ''}, placeholder: end_label.humanize)
        end)
      end
    end
  end

  def list_ops_select(model, column, input_name, icon, options, html_options={class: 'uk-width'})
    qp = request.query_parameters
    list_ops_with_label(model, column, input_name, icon) do
      select_tag(input_name, options_for_select(options, :selected => qp[input_name]), html_options)
    end
  end

  def list_ops_submit(title, with_fake_label: true, data: {})
    content_tag :div, class: %w(uk-form-row) do
      with_fake_label && concat(label_tag('', '&nbsp;'.html_safe, class: %W(uk-form-label #{with_fake_label})))
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        button_tag title, class: 'uk-button uk-width', data: data
      end)
    end
  end

end
