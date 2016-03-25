class AddGroupTypeCastOptionsToSettings < ActiveRecord::Migration[5.0]

  def change
    add_column :settings, :group, :integer, null: false
    add_column :settings, :kind, :string, null: false
    add_column :settings, :cast, :string, null: false
    add_column :settings, :options, :string, null: true
    change_column :settings, :key, :string, null: false
    change_column :settings, :val, :string, null: false
  end

end
