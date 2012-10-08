class SessionsController < ApplicationController
  def new
    @products = Product.showSixLatestProduct
    @articles = Article.showThreeLatestArticle
  end
  def create
    user = User.authenticate(params[:email],params[:password])
    @products = Product.showSixLatestProduct
    @articles = Article.showThreeLatestArticle
    # raise "dor"
    if user
      session[:user_id] = user.id
        redirect_to root_url, :notice => "Welcome " << user.email
    else
      flash[:error] = "Invalid email or password" 
      render "new"
    end
  end

  def destroy
  	session[:user_id]=nil
  	redirect_to log_in_path, :notice => "Logged out!"
  end
end
