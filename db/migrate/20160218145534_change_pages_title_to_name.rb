class ChangePagesTitleToName < ActiveRecord::Migration[5.0]
  def change
    rename_column :pages, :title, :name
  end
end
