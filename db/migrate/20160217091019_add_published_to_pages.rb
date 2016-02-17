class AddPublishedToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :published, :boolean, null: false, default: false
  end
end
