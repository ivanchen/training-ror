class Product < ActiveRecord::Base
  attr_accessible :id, :name, :price, :description, :weight, :user_id, :category_id
  belongs_to :user
  has_many :products_categories
  belongs_to :category

  #metode to show 6 newest product
  def self.showSixLatestProduct
  	@products = Product.find(:all, :order => "id desc", :limit => 6)
  	return @products
  end
end
