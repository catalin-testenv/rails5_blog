class AddOrderingToPageCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :page_categories, :ordering, :integer
  end
end
