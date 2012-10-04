class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description, :weight, :user_id, :category_id
  belongs_to :user
  has_many :products_categories

  #metode to show 6 newest product
end
