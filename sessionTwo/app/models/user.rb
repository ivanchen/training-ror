class User < ActiveRecord::Base
  self.primary_key = "id" 
  attr_accessible :first_name, :last_name, :email, :username, :address, :age, :birthday
  has_many :products,  :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :my_countries_story,
           :class_name => "Article" ,
             :foreign_key => "user_id" ,
             :conditions => "title like '%my_country%'"
  belongs_to :country

  validates :first_name, 	:presence => true,
	                    	:length => {:minimum => 1, :maximum => 20},
	                    	:uniqueness => true,
	                    	:format => {:with => /[a-zA-Z\s]+$/}
  validates :email, :presence => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  def show_full_address
    "#{self.address} #{self.country.name}"
  end
end