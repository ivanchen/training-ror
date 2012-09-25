class ForeignKey < ActiveRecord::Migration
  def up
  	add_column :users, :country_id, :integer
  	add_column :products, :user_id, :integer
  	add_column :articles, :user_id, :integer
  	add_column :comments, :article_id, :integer
  end

  def down
  end
end
