module FormHelper

  def form_global_errors(resource, model)
    if resource.errors.any?
      content_tag :div, class: %w(uk-alert uk-alert-danger cancel-panel-box-horizontal-padding) do
        concat(content_tag(:h4) do
          resource_view_form_general_error_message resource: model, errors_num: resource.errors_num
        end)
        concat(content_tag(:ul) do
          resource.errors.full_messages.map do |message|
            content_tag :li do
              message
            end
          end.join("\n").html_safe
        end)
      end
    end
  end

  def form_input_with_label(f, name, icon)
    capture do
      content_tag :div, class: %w(uk-form-row) do
        concat(form_label(f, name, icon))
        concat(content_tag(:div, class: %w(uk-form-controls)) do
          yield if block_given?
        end)
      end
    end
  end

  def form_input_with_errors(f, name)
    capture do
      f.object.errors[name].map do |e|
        content_tag(:p, class: %w(uk-form-help-block uk-text-danger)) do
          if block_given?
            yield
          else
            "#{f.object.class.human_attribute_name(name) } #{e}"
          end
        end
      end.join("\n").html_safe
    end
  end

  def form_label(f, name, icon, html_options={class: %w(uk-form-label)})
    capture do
      f.label(name, **html_options) do
        if icon.present?
          icon + '&nbsp;&nbsp;'.html_safe + f.object.class.human_attribute_name(name)
        else
          f.object.class.human_attribute_name(name)
        end
      end
    end
  end

  def form_label_span(f, name, icon, html_options={class: %w(uk-form-label)})
    capture do
      content_tag(:span, **html_options) do
        if icon.present?
          icon + '&nbsp;&nbsp;'.html_safe + f.object.class.human_attribute_name(name)
        else
          f.object.class.human_attribute_name(name)
        end
      end
    end
  end

  def form_input(f, type, name, icon, html_options={})
    capture do
      concat(form_input_with_label(f, name, icon) do
        f.send(type, name, class: 'uk-width', **html_options)
      end)
      concat(form_input_with_errors(f, name))
    end
  end

  def form_select(f, name, icon, options, selected, select_options={}, html_options={})
    capture do
      concat(form_input_with_label(f, name, icon) do
        f.select(name, options_for_select(options, :selected => selected), select_options, {class: 'uk-width'}.merge(html_options))
      end)
    end
  end

  def form_radio(f, name, icon, values)
    cols = (1..6) === values.length ? values.length : 10
    content_tag :div, class: %w(uk-form-row) do
      concat(form_label_span(f, name, icon))
      concat(content_tag(:div, class: %w(uk-grid uk-grid-collapse)) do
        values.each { |key, value|
          concat(content_tag(:div, class: %W(uk-width-1-#{cols})) do
            concat f.radio_button(name, key)
            concat(label_tag("#{f.object.class.name.demodulize.underscore}_#{name}_#{key}", value, class: %w(uk-width)))
          end)
        }
      end)
    end
  end


  def form_check_box(f, name, icon)
    capture do
      concat f.check_box(name)
      concat(form_label(f, name, icon, class: 'uk-width'))
    end
  end

  def form_button(f, name, with_fake_label=true, html_options={})
    content_tag :div, class: %w(uk-form-row) do
      with_fake_label && concat(label_tag('', '&nbsp;'.html_safe, class: %W(uk-form-label #{with_fake_label})))
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        f.button name,  class: 'uk-button uk-width', **html_options
      end)
    end
  end

  # @param title String
  # @param modal_target_id String
  # @param action String
  # @param model_class String
  # @param values Hash
  # to be used in conjunction with data-show-edit-form js helper
  def form_dialog_editable_li_as_dropdown(title, modal_target_id, action, model_class, values, **html_options)
    content_tag(:li, **html_options) do
      %Q`
        <div class="uk-button-dropdown uk-dropdown-close" data-uk-dropdown="{mode:'click'}">
            <a class="secondary-link" onclick="event.preventDefault();"><span>#{title}</span></a>
            <div class="uk-dropdown uk-dropdown-small">
              <ul class="uk-nav uk-nav-dropdown uk-padding-left-remove">
                <li>#{ link_to "#{icon_edit}&nbsp;&nbsp;#{edit_message}".html_safe, modal_target_id, class: 'secondary-link font-weight-normal', data: {'show-edit-form' => 'patch', 'action' => action, 'model-class' => model_class, 'values' => values} }</li>
                <li>#{ link_to "#{icon_destroy}&nbsp;&nbsp;#{destroy_message}".html_safe, action, class: 'secondary-link font-weight-normal', method: :delete, data: { confirm: are_you_sure_message } }</li>
              </ul>
            </div>
        </div>
      `.html_safe
    end

  end

end
