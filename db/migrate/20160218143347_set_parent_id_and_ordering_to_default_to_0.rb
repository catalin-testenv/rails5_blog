class SetParentIdAndOrderingToDefaultTo0 < ActiveRecord::Migration[5.0]
  def change
    change_column :pages, :ordering, :integer, null: false, default: 0
    change_column :pages, :parent_id, :integer, null: false, default: 0
    change_column :page_categories, :ordering, :integer, null: false, default: 0
    change_column :page_categories, :parent_id, :integer, null: false, default: 0
  end
end
