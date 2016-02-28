
class PageCategoryPolicy < ApplicationPolicy

  def show?
    admin_and_admin_controller_or_not_admin_controller
  end

end
