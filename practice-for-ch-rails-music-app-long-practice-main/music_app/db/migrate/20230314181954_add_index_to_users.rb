class AddIndexToUsers < ActiveRecord::Migration[7.0]
  def change

    add_index :users, :email
    add_index :users, :session_token, unique: true
  end
end
