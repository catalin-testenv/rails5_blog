class AddCssJsIsMainNavToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :meta_css, :text, limit: 16777215
    add_column :pages, :meta_js, :text, limit: 16777215
    add_column :pages, :is_main_nav, :boolean, null: false, default: false
    add_column :pages, :is_commentable, :boolean, null: false, default: false
    add_column :pages, :max_comments, :integer, null: false, default: 50
  end
end
