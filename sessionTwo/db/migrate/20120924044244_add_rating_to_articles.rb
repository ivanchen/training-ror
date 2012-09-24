class AddRatingToArticles < ActiveRecord::Migration
  def up
  	add_column :articles, :rating, :integer
  end
end
