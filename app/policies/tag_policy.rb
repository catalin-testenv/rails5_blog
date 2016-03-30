
class TagPolicy < ApplicationPolicy

  def show?
    not_admin_controller
  end

end
