module SettingsHelper

  def setting_get(name)
    @site_settings ||= Setting.all
    setting = @site_settings.find{ |setting| setting.key == name}
    setting.val.send(setting.cast)
  end

end
