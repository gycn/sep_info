class RemoveUserFromGroupInterviews < ActiveRecord::Migration
  def change
    remove_column :group_interviews, :user_id
    change_table :group_interviews do |t|
      t.belongs_to :application
    end
  end
end
