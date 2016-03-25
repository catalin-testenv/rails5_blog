class Admin::SettingsController < Admin::AdminController

  def index
    authorize Setting
    skip_policy_scope
    @resource_list = Setting.all.to_a
  end

end
