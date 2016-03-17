
# related files: list_ops_concern list_ops_helper list_ops_config

# list_ops_config initializer auto-includes this module in ActionController::Base
module ListOpsConcern
  extend ActiveSupport::Concern

  included do

    # Controller helper to be used in controller's index like methods.
    # ex: def index
    #   @resource_list = list_ops_sort(Model.all)
    # end
    def list_ops_sort(scope)
      if list_ops_sort_orderby != ''
        scope.reorder("#{list_ops_sort_orderby} #{list_ops_sort_direction}")
      else
        scope
      end
    end

    # Get the list of columns that should be sortable.
    # This method is trying to infer model name from controller name then retrieve from it column_names.
    # Target controller can override this when autodetect does not do the job.
    # Override method should return something like:  Model.column_names
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