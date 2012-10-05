class Article < ActiveRecord::Base
  attr_accessible :title, :body, :user_id
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, 		:presence => true,
	                    	:length => {:minimum => 1, :maximum => 254},
	                    	:uniqueness => true
  # create install model to show only 3 newest article
  def self.showThreeLatestArticle
  	@articles = Article.find(:all, :order => "id desc", :limit => 3)
  	return @articles
  end
end
