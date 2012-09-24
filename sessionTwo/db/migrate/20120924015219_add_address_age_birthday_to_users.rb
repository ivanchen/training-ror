class AddAddressAgeBirthdayToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :address, :text
  	add_column :users, :age, :integer
  	add_column :users, :birthday, :datetime
  end
end
