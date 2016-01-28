class RemoveUserFromInterviews < ActiveRecord::Migration
  def change
    remove_column :interviews, :user_id
    change_table :interviews do |t|
      t.belongs_to :application
    end
  end
end
