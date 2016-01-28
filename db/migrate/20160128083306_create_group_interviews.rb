class CreateGroupInterviews < ActiveRecord::Migration
  def change
    create_table :group_interviews do |t|
      t.string :author
      t.belongs_to :user, index: true
      t.integer :score
      t.text :commments
      t.timestamps
    end
  end
end
