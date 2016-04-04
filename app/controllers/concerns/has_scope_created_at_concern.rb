
module HasScopeCreatedAtConcern
  extend ActiveSupport::Concern

  included do
    has_scope :created_at_period, :using => [:starting, :ending], :type => :hash
  end

  module ClassMethods
  end

end