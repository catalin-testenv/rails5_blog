
# related files: list_ops list_ops_helper list_ops_config

# list_ops_config initializer auto-includes this module in ActionController::Base
module ListOps
  extend ActiveSupport::Concern

  included do

    # To be used in controller's index like methods.
    # ex: @resource_list = list_ops_sort(Model.all)
    def list_ops_sort(scope)
      if list_ops_sort_orderby != ''
        scope.reorder("#{list_ops_sort_orderby} #{list_ops_sort_direction}")
      else
        scope
      end
    end

    # This method is trying to infer model name from controller name.
    # Target controller can override this when autodetect does not do the job.
    # Override method would return:  Model.column_names
    def list_ops_sortable_columns
      self.class.name.split('::')[-1].sub('Controller', '').singularize.constantize.column_names
    end

    def list_ops_sort_orderby
      list_ops_sortable_columns.include?(params[:orderby]) ? params[:orderby] : ''
    end

    def list_ops_sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    helper_method :list_ops_sort_orderby, :list_ops_sort_direction

  end

  module ClassMethods
  end

end