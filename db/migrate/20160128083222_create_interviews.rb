class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :interviewer_1
      t.decimal :score_1
      t.text :notes_1
      t.string :interviewer_2
      t.decimal :score_2
      t.text :notes_2
      t.string :interviewer_3
      t.decimal :score_3
      t.text :notes_3

      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
