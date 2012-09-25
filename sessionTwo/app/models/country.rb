class Country < ActiveRecord::Base
  attr_accessible :code, :name
  has_many :users
  validates :code, 	:presence => true,
                   	:length => {:minimum => 1, :maximum => 3},
                	:format => {:with => /(usa)|(id)|(frc)/}
end
