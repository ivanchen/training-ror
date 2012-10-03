class CreateProductsCategories < ActiveRecord::Migration
  def change
    create_table :products_categories do |t|

      t.timestamps
    end
  end
end
