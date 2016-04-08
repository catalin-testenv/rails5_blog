class AllowUserEmailBeNull < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, name: :index_users_on_email
    change_column :users, :email, :string, index: true, null: true
  end
end
