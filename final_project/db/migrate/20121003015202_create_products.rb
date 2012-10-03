class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :weight
      t.integer :user_id
      t.integer :category_id
    end
  end
end
