class DropDatabaseAuthenticableFromDevise < ActiveRecord::Migration[5.0]
  def change
    revert do
      reversible do |dir|
        dir.down do
          remove_column :users, :encrypted_password
          remove_column :users, :reset_password_token
          remove_column :users, :reset_password_sent_at
          remove_column :users, :remember_created_at
          remove_column :users, :sign_in_count
          remove_column :users, :current_sign_in_at
          remove_column :users, :last_sign_in_at
          remove_column :users, :current_sign_in_ip
          remove_column :users, :last_sign_in_ip
        end
        dir.up do
          add_column :users, :encrypted_password, :string,  null: false, default: ''
          add_column :users, :reset_password_token, :string
          add_column :users, :reset_password_sent_at, :datetime
          add_column :users, :remember_created_at, :datetime
          add_column :users, :sign_in_count, :integer, default: 0, null: false
          add_column :users, :current_sign_in_at, :datetime
          add_column :users, :last_sign_in_at, :datetime
          add_column :users, :current_sign_in_ip, :string
          add_column :users, :last_sign_in_ip, :string
        end
      end
    end
  end
end
