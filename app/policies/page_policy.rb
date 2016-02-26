
class PagePolicy < ApplicationPolicy

  include ControllerDependentPolicy

  def show?
    admin_and_admin_controller_or_not_admin_controller
  end

  def root?
    true
  end

end
