class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :email, :null => false
      t.string :omniauth_uid, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :omniauth_uid, :unique => true
  end

  def self.down
    drop_table :users
  end
end
