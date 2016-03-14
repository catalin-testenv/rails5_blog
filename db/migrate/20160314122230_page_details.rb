class PageDetails < ActiveRecord::Migration[5.0]
  def change

    create_table :page_content do |t|
      # TINYTEXT - 256 bytes
      # TEXT - 65,535 bytes
      # MEDIUMTEXT - 16,777,215 bytes
      # LONGTEXT - 4,294,967,295 bytes
      t.integer :page_id, null: false
      t.text :content, null: false, limit: 16777215
      t.text :excerpt, limit: 150
      t.text :meta_description, limit: 150
      t.text :meta_css, limit: 16777215
      t.text :meta_js, limit: 16777215
    end

    change_table :pages do |t|
      t.remove :content, :excerpt, :meta_description, :meta_css, :meta_js
    end

  end
end
