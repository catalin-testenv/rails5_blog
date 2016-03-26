module Admin::SettingsHelper
  def settings_field(resource)
    fields_for 'setting[]', resource do |f|
      content_tag(:div, class: %w(uk-form-row)) do
        concat(f.label(:val, class: %w(uk-form-label)) do
          t("setting.key.#{resource.key}").humanize
        end)
        concat(content_tag(:div, class: %w(uk-form-controls)) do
          case resource.kind
            when 'integer', 'float', 'string'
              f.text_field :val, class: 'uk-width'
            when 'enum'
              f.select(:val, options_for_select(resource.options.split('|'), :selected => resource.val), {}, {class: 'uk-width'})
            when 'boolean' # checkbox
            when 'text'
              content_tag(:div, class: '') do
                f.text_area :val, class: 'uk-width', data: {
                  'editor-ace': %Q`{"sessionOptions": {"language":"#{
                  case resource.key
                    when /javascript/
                      'javascript'
                    when /css/
                      'css'
                    when /html_ruby/
                      'html_ruby'
                  end}"}}`
                }
              end
          end
        end)
      end
    end
  end
end