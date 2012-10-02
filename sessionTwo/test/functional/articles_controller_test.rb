require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @post = Article.find(:first)
    assert_not_nil @post
  end

  # def destroy
  # 	login_as('ivan.andhika@kiranatama.com')
  # 	id = 1
  #   @article_id = Article.find(id)
  #   assert_not_nil? @article_id.destroy true
  # end

  def test_destroy
  	login_as('ivan.andhika@kiranatama.com')
    @article_id = Article.find(1)
     assert_not_nil @article_id.destroy
  end

	def test_new
	  login_as('ivan.andhika@kiranatama.com')
	  get :new
	  assert_not_nil assigns(:article)
	  assert_response :success
	end



end
