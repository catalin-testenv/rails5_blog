class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def change
    revert do
      reversible do |dir|
        dir.down do
          add_column :users, :role, :integer, default: 0
        end
        dir.up do
          remove_column :users, :role
        end
      end
    end
  end
end
