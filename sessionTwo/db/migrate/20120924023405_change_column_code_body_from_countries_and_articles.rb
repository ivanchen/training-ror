class ChangeColumnCodeBodyFromCountriesAndArticles < ActiveRecord::Migration
  def up
  	change_column :countries, :code, :string
  	change_column :articles, :body, :text
  end

  def down
  end
end
