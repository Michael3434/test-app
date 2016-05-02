class AddWantToBeHostToUsers < ActiveRecord::Migration
  def change
    add_column :users, :want_host, :boolean
  end
end
