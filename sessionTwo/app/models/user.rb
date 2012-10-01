class User < ActiveRecord::Base
  self.primary_key = "id" 
  attr_accessible :first_name, :last_name, :email, :username, :address, :age, :birthday, :password, :password_confirmation
  before_save :encrypt_password
  has_many :products,  :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_many :my_countries_story,
           :class_name => "Article" ,
             :foreign_key => "user_id" ,
             :conditions => "title like '%my_country%'"
  belongs_to :country
  attr_accessor :password, :password_confirmation
  # validates :first_name, 	:presence => true,
	 #                    	:length => {:minimum => 1, :maximum => 20},
	 #                    	:uniqueness => true,
	 #                    	:format => {:with => /[a-zA-Z\s]+$/}
  validates :email, :presence => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :password, :presence => {:on => :create},
                     :confirmation => true
  def show_full_address
    "#{self.address} #{self.country.name}"
  end
  def encrypt_password
  if password.present?
          self.password_salt = BCrypt::Engine.generate_salt
          self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
     end
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def is_admin?
    if self.id==1
      return true
    else 
      return false
    end
  end


end