class ChangeAnayticalToAnalyticalInCoffeeChats < ActiveRecord::Migration
  def change
    rename_column :coffee_chats, :anaytical, :analytical
  end
end
