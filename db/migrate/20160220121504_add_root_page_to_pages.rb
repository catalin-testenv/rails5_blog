class AddRootPageToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :root_page, :boolean, null: false, default: false
  end
end
