class Article < ActiveRecord::Base
  attr_accessible :title, :body, :user_id
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, 		:presence => true,
	                    	:length => {:minimum => 1, :maximum => 254},
	                    	:uniqueness => true
end
