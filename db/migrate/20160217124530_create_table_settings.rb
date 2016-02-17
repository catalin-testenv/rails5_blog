class CreateTableSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_settings do |t|
      t.string :key
      t.text :val
    end
  end
end


