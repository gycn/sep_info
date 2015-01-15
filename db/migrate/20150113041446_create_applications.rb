class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.belongs_to :user

      t.string :name
      t.string :email
      t.string :phone_number
      t.string :year
      t.string :major

      t.text :extracurriculars
      t.text :hobbies
      t.text :why_sep

      t.text :short_answer1
      t.text :short_answer2
      t.text :short_answer3
      t.text :short_answer4

      t.string :reference

      t.attachment :picture
      t.attachment :resume

      t.text :availabilities

      t.boolean :submitted, default: false

      t.timestamps
    end
  end
end
