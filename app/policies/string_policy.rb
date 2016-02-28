
class StringPolicy < ApplicationPolicy

  def home?
    admin_and_admin_controller
  end

end