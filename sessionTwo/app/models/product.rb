class Product < ActiveRecord::Base
  attr_accessible :name, :price, :description
  belongs_to :user
  has_many :products_categories
  scope :gt1000, where("price >1000")
  scope :price_greater_than, lambda {|price| where("price > ?", price) }
  scope :likeRed, where("description like '%red%'");
end
