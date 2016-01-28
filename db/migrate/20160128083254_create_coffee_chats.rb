class CreateCoffeeChats < ActiveRecord::Migration
  def change
    create_table :coffee_chats do |t|
      t.belongs_to :user, index: true
      t.string :interviewer_1
      t.string :interviewer_2
      t.integer :overall
      t.integer :empathy
      t.integer :grit
      t.integer :curiosity
      t.integer :anaytical
      t.text :comments
      t.timestamps
    end
  end
end
