class RenameAdminSettingsToSettings < ActiveRecord::Migration[5.0]
  def change
    rename_table :admin_settings, :settings
  end
end
