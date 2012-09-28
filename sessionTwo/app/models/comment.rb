class Comment < ActiveRecord::Base
  attr_accessible :content, :id, :article_id
  belongs_to :article
end
