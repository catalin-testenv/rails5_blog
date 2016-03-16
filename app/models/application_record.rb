class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :updated_at_period, -> (starting, ending) do
    where('updated_at BETWEEN ? AND ?', starting || 50.years.ago, ending || DateTime.current)
  end

  def to_name
    id
  end

  def errors_num
    ActionController::Base.helpers.pluralize(errors.count, I18n.t(:error), locale: I18n.locale)
  end

end
