require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  	def test_min_req
	  post = Article.new(:title=>"random-0", :body => "this body",:user_id => 1);
	  assert_equal post.valid?, true
	  assert_equal post.save, true
	end

	def test_title_body_no_user_id
	  post = Article.new(:title=>"random-0", :body => "this body");
	  assert_equal post.valid?, true
	  assert_equal post.save, true
	end

	def test_relation_between_article_and_comment
		post = Article.create(:title => "new_title", :body => "new content")
		assert_not_nil post
		comment = Comment.create(:article_id => post.id, :content => "my comment")
		assert_not_nil post.comments
		assert_equal post.comments.empty?, false
		assert_equal post.comments[0].class, Comment
	end
end
