class RenamePageContent < ActiveRecord::Migration[5.0]
  def change
    rename_table :page_content, :page_contents
  end
end
