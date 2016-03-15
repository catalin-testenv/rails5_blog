
# include this concern in ApplicationController
module ListOps
  extend ActiveSupport::Concern

  included do

    def sort(scope)
      if sort_column != ''
        scope.reorder("#{sort_column} #{sort_direction}")
      else
        scope
      end
    end

    # target controller should override this method
    # ex: Model.column_names
    def sortable_columns
      []
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : ''
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    helper_method :sort_column, :sort_direction

  end

  module ClassMethods
  end

end