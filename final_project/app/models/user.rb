class User < ActiveRecord::Base
  self.primary_key = "id"
  attr_accessible :id, :email, :password_hash, :password_salt, :name, :address, :phone_number, :birthday, :gender, :facebook, :blog, :password, :password_confirmation
  before_save :encrypt_password
  has_many :products, :dependent => :destroy
  has_many :articles, :dependent => :destroy

  attr_accessor :password, :password_confirmation

  validates :email, :presence => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :password, :presence => {:on => :create},
                     :confirmation => true
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
