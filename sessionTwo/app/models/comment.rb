class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :article
end
