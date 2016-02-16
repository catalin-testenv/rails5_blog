class AddDetailsToArticles < ActiveRecord::Migration[5.0]
  def change
    revert do
      reversible do |dir|
        dir.down do
          # TINYTEXT - 256 bytes
          # TEXT - 65,535 bytes
          # MEDIUMTEXT - 16,777,215 bytes
          # LONGTEXT - 4,294,967,295 bytes
          change_column :articles, :title, :string, null: false
          add_column :articles, :content, :text, null: false, limit: 16777215
          add_column :articles, :meta_description, :text, limit: 150
          add_column :articles, :excerpt, :text, limit: 150
        end
        dir.up do
          remove_column :articles, :content
          remove_column :articles, :meta_description
          remove_column :articles, :excerpt
        end
      end
    end
  end
end
