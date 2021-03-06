class Admin::SettingsController < Admin::AdminController

  def index
    authorize Setting
    skip_policy_scope
    @resource_list = Setting.all.to_a
  end

  # POST /admin/settings/bulk_update
  def bulk_update
    authorize Setting
    skip_policy_scope

    Setting.transaction do
      # Setting.update(bulk_params.keys, bulk_params.values) # this doesn't throw exception though
      bulk_params.each do |key, values|
        Setting.find(key).update!(val: values['val'])
      end
    end

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
    # ex: {"setting"=>{"10"=>{"val"=>"My Blog"}, "11"=>{"val"=>"motto here"}}}
    params.require(:setting).permit(Setting.all.pluck(:id).map.with_object({}){|id, h| h[id.to_s] = [:val]})
  end

end
