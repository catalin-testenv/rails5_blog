class RenameTableArticlesToPages < ActiveRecord::Migration[5.0]
  def change
    rename_table :articles, :pages
  end
end
