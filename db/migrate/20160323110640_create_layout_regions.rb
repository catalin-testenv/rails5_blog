class CreateLayoutRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :layout_regions do |t|
      t.string :name, null: false
      t.text :content, limit: 16777215
    end
  end
end
