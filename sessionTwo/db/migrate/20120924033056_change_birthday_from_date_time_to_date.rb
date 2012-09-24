class ChangeBirthdayFromDateTimeToDate < ActiveRecord::Migration
  def up
  	change_column :users, :birthday, :date
  end

  def down
  end
end
