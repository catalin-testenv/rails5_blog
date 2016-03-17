
ActionController::Parameters.always_permitted_parameters += %w(orderby direction)

class ActionController::Base
  include ListOpsConcern
end