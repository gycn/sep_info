class RemoveUserFromCoffeeChats < ActiveRecord::Migration
  def change
    remove_column :coffee_chats, :user_id
    change_table :coffee_chats do |t|
      t.belongs_to :application
    end
  end
end
