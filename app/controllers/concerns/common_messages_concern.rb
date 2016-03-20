module CommonMessagesConcern
  extend ActiveSupport::Concern

  included do

    %w|resource_creation_success resource_creation_failed
      resource_update_success resource_update_failed
      resource_bulk_update_success resource_bulk_destroy_success
      resource_destroy_success resource_destroy_failed
      resource_view_listing resource_view_editing
      resource_view_new resource_view_show
      resource_view_form_general_error
      authorization.failure sign_in sign_out
      show edit destroy back list preview are_you_sure menu root
      |.each do |template|
        meth = "#{template.gsub(/\./,'_')}_message"
        define_method(meth) { |**params|
          if params[:resource_instance]
            params[:resource] = params[:resource_instance].class
            params[:resource_name] = params[:resource_instance].to_name
          end
          params[:resource] &&= params[:resource].model_name.human(count: params.fetch(:count, 1))
          default = if template.end_with?('success')
                      :default_ok
                    elsif template.end_with?('failed')
                      :default_nok
                    else
                      :default
                    end
          I18n.t(template, **params, default: default).humanize
        }
        helper_method meth
    end

  end

  module ClassMethods
  end

end