class Article < ActiveRecord::Base
  attr_accessible :title, :body, :rating, :user_id
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :title, 		:presence => true,
	                    	:length => {:minimum => 1, :maximum => 254},
	                    	:uniqueness => true
  validate :valid_title
  def valid_title
  	self.errors[:title] << "can't filled by 'empty' or 'blank' or 'nil'" if title == 'empty' || title == 'blank' || title == 'nil'
  end
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
