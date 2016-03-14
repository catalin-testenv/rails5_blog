module FormHelper

  def form_global_errors(resource, model)
    html = ''
    if resource.errors.any?
      html << %Q`
      <div class="uk-alert uk-alert-danger cancel-panel-box-horizontal-padding">
        <h4>#{resource_view_form_general_error_message resource: model, errors_num: resource.errors_num }:</h4>
        <ul>`
         resource.errors.full_messages.each do |message|
            html << "<li>#{message}</li>"
         end
      html << %q`</ul>
      </div>
      `
    end
    html.html_safe
  end

  def form_input(f, type, name)
    html = ''
    html << f.label(name, class: 'uk-form-label') do |e|
      f.object.class.human_attribute_name(name)
    end
    html << %Q`
    <div class="uk-form-controls">
      #{f.send(type, name, class: 'uk-width')}
    </div>
    `
    html << f.object.errors[name].map do |e|
        %Q`<p class="uk-form-help-block uk-text-danger">#{f.object.class.human_attribute_name(name) } #{e}</p>`
    end.join("\n")
    html.html_safe
  end

  def form_select(f, name, options, selected, select_options={})
    html = ''
    html << f.label(name, class: 'uk-form-label') do |e|
      f.object.class.human_attribute_name(name)
    end
    html << %Q`
    <div class="uk-form-controls">
      #{f.select(name, options_for_select(options, :selected => selected), select_options, {class: 'uk-width'})}
    </div>
    `
    html.html_safe
  end

  def form_check_box(f, name)
    html = ''
    html << f.check_box(name)
    html << f.label(name, f.object.class.human_attribute_name(name), class: 'uk-width')
    html.html_safe
  end

end
