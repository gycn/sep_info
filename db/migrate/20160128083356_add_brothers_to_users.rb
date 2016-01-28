class AddBrothersToUsers < ActiveRecord::Migration
  def change
    add_column :users, :brother, :boolean 
  end
end
