class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_name
    id
  end

  def errors_num
    ActionController::Base.helpers.pluralize(errors.count, I18n.t(:error), locale: I18n.locale)
  end

end
