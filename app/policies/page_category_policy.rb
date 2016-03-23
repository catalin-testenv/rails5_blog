
class PageCategoryPolicy < ApplicationPolicy

  def show?
    not_admin_controller
  end

end
