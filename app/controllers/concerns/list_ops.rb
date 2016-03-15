
# related files: list_ops list_ops_helper list_ops_config

# include this concern in ApplicationController
module ListOps
  extend ActiveSupport::Concern

  included do

    def sort(scope)
      if sort_orderby != ''
        scope.reorder("#{sort_orderby} #{sort_direction}")
      else
        scope
      end
    end

    # target controller should override this method
    # ex: Model.column_names
    def sortable_columns
      []
    end

    def sort_orderby
      sortable_columns.include?(params[:orderby]) ? params[:orderby] : ''
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    helper_method :sort_orderby, :sort_direction

  end

  module ClassMethods
  end

end