class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|

      t.integer :code
      t.string :name
    end
  end
end
