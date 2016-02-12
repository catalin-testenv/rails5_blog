class AddNameImageToUsers < ActiveRecord::Migration[5.0]
  def change
    revert do
      reversible do |dir|
        dir.down do
          add_column :users, :name, :string
          add_column :users, :image, :string
        end
        dir.up do
          remove_column :users, :name
          remove_column :users, :image
        end
      end
    end
  end
end
