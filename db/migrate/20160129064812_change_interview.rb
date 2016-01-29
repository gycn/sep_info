class ChangeInterview < ActiveRecord::Migration
  def change
    change_table :interviews do |t|
      t.remove :notes_1, :notes_2, :notes_3, :score_1, :score_2, :score_3
      t.decimal :gpa
      t.integer :score_1
      t.text :question_1

      t.integer :score_2
      t.text :question_2

      t.integer :score_3
      t.text :question_3

      t.integer :score_4
      t.text :question_4

      t.integer :score_5
      t.text :question_5

      t.integer :score_6
      t.text :question_6

      t.integer :overall

      t.text :question_7
      t.text :question_8
      t.text :comments
end
  end
end
