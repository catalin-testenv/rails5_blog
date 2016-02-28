class Admin::HomeController < Admin::AdminController

  def home
    authorize self.class.name
    skip_policy_scope
  end
end
