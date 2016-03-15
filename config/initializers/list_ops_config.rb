
ActionController::Parameters.always_permitted_parameters += %w(orderby direction)
# ActionController::Parameters.always_permitted_parameters += [:current_page, :page, :total_pages, :per_page, :remote, :paginator]

class ActionController::Base
  include ListOps
end