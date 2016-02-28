
# Some policies like PagePolicy, PageCategoryPolicy ... are accessed from two controllers
# (PagesController/PageCategoriesController and Admin::PagesController/Admin::PageCategoriesController)
# both dealing with the same Page/PageCategory model via the same action: 'show'
# So, authorization is also dependable of which controller is in use
# if AdminController then user must be admin else authorization granted only if !AdminController
# We injected controller into UserContext in ApplicationController (as suggested in Pundit documentation)

module ControllerDependentPolicy

  def admin_and_admin_controller
    ctrl.is_a?(Admin::AdminController) && user && user.admin?
  end

  def admin_and_admin_controller_or_not_admin_controller
    admin_and_admin_controller || !ctrl.is_a?(Admin::AdminController)
  end

end