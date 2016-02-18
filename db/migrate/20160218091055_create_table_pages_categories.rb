class CreateTablePagesCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :page_categories do |t|
      t.string :name
      t.integer :parent_id, null: true
    end
  end
end
