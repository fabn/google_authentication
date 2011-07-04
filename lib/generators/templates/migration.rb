class DeviseCreate<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    create_table(:<%= table_name %>) do |t|
      t.string :email, :null => :false
      t.string :omniauth_uid, :null => false

      # t.rememberable
      # t.trackable
      # t.confirmable
      # t.token_authenticatable

<% for attribute in attributes -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>

      t.timestamps
    end

    add_index :<%= table_name %>, :email,                :unique => true
    add_index :<%= table_name %>, :omniauth_uid,         :unique => true
    # add_index :<%= table_name %>, :authentication_token, :unique => true
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
