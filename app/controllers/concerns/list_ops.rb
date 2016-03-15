
# related files: list_ops list_ops_helper list_ops_config

# include this concern in ApplicationController
module ListOps
  extend ActiveSupport::Concern

  included do

    def list_ops_sort(scope)
      if list_ops_sort_orderby != ''
        scope.reorder("#{list_ops_sort_orderby} #{list_ops_sort_direction}")
      else
        scope
      end
    end

    # this method is trying to infer model name from controller name
    # target controller might override this method when autodetect does not do the job
    # ex. return:  Model.column_names
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