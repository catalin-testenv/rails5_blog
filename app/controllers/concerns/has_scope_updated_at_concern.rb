
module HasScopeUpdatedAtConcern
  extend ActiveSupport::Concern

  included do
    has_scope :updated_at_period, :using => [:starting, :ending], :type => :hash
  end

  module ClassMethods
  end

end