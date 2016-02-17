
# PagePolicy is accessed from two controllers (PagesController and Admin::PagesController)
# both dealing with the same Page model via the same action: 'show'
# So, authorization is also dependable of which controller is in use
# if AdminController then user must be admin else authorization granted only if !AdminController
# We injected controller into UserContext in ApplicationController (as suggested in Pundit documentation)

class PagePolicy < ApplicationPolicy
  def show?
    ctrl.is_a?(Admin::AdminController) && user && user.admin? ||
          !ctrl.is_a?(Admin::AdminController)
  end
end
