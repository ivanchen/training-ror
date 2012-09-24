class RemoveBioProfileFromUsers < ActiveRecord::Migration
  def up
  end

  def change
  	remove_column :users, :bio_profile
  end
end
