class Category < ActiveRecord::Base
  attr_accessible :id, :name, :parent_id
  has_many :products_categories
  has_many :products
   scope :child, lambda {|parent_id| where("parent_id = ?", parent_id) }

  def self.getParent
  	@catogories = Category.find_all_by_parent_id("")
  	return @catogories
  end
 
end
