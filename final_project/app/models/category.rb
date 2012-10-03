class Category < ActiveRecord::Base
  attr_accessible :id, :name, :parent_id
  has_many :products_categories
end
