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

  def form_input(f, type, name)
    capture do
      concat(label_tag(name, class: %w(uk-form-label)) do
        f.object.class.human_attribute_name(name)
      end)
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        f.send(type, name, class: 'uk-width')
      end)
      concat(f.object.errors[name].map do |e|
        content_tag(:p, class: %w(uk-form-help-block uk-text-danger)) do
          "#{f.object.class.human_attribute_name(name) } #{e}"
        end
      end.join("\n").html_safe)
    end
  end

  def form_select(f, name, options, selected, select_options={})
    capture do
      concat(label_tag(name, class: %w(uk-form-label)) do
        f.object.class.human_attribute_name(name)
      end)
      concat(content_tag(:div, class: %w(uk-form-controls)) do
        f.select(name, options_for_select(options, :selected => selected), select_options, {class: 'uk-width'})
      end)
    end
  end

  def form_check_box(f, name)
    capture do
      concat f.check_box(name)
      concat f.label(name, f.object.class.human_attribute_name(name), class: 'uk-width')
    end
  end

end
