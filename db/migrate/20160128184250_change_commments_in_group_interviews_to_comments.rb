class ChangeCommmentsInGroupInterviewsToComments < ActiveRecord::Migration
  def change
    rename_column :group_interviews, :commments, :comments
  end
end
