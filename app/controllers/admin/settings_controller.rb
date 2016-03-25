class Admin::SettingsController < Admin::AdminController

  def index
    authorize Setting
    skip_policy_scope
    @resource_list = Setting.all.to_a
  end

  # POST /admin/pages/bulk_update
  def bulk_update
    authorize Setting
    skip_policy_scope

    Setting.update(bulk_params.keys, bulk_params.values)

    respond_to do |format|
      format.html do
        redirect_to admin_settings_path, notice: resource_bulk_update_success_message
      end
    end
  rescue => e
    respond_to do |format|
      format.html do
        redirect_to admin_settings_path, alert: e.message
      end
    end
  end

  private

  def bulk_params
    params.require(:setting).permit(Setting.all.pluck(:id).map.with_object({}){|id, h| h[id.to_s] = [:val]})
  end

end
