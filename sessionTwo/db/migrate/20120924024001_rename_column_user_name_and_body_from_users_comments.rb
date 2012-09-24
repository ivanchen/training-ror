class RenameColumnUserNameAndBodyFromUsersComments < ActiveRecord::Migration
  def up
  	rename_column :users, :user_name, :user_name
  	rename_column :comments, :body, :content
  end

  def down
  end
end
