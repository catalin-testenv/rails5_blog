
module ScopeCreatedAtConcern
  extend ActiveSupport::Concern

  included do
    scope :created_at_period, -> (starting, ending) do
      where("#{self.table_name}.created_at BETWEEN ? AND ?", starting || 50.years.ago, ending || DateTime.current)
    end
  end

  module ClassMethods
  end

end