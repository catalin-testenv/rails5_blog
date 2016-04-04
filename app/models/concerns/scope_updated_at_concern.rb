
module ScopeUpdatedAtConcern
  extend ActiveSupport::Concern

  included do
    scope :updated_at_period, -> (starting, ending) do
      where("#{self.table_name}.updated_at BETWEEN ? AND ?", starting || 50.years.ago, ending || DateTime.current)
    end
  end

  module ClassMethods
  end

end