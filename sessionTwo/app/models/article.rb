class Article < ActiveRecord::Base
  attr_accessible :title, :body
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, 		:presence => true,
	                    	:length => {:minimum => 1, :maximum => 254},
	                    	:uniqueness => true,
	                    	:format => {:with => /(!empty)|(!nil)|(!blank)/}
scope :rating, lambda {|rating| where("rating = ?", rating) }	

def content_more_100_char
	content = self.body;
	lenght_of_content = content.length()
	if(lenght_of_content>100)
	"#{self.body}"
	else
		"tidak ada data yang lebih dari 100 karakter"
	end
end
end
