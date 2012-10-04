class SessionsController < ApplicationController
  def new
    @products = Product.all
    @articles = Article.all
  end
  def create
    user = User.authenticate(params[:email],params[:password])
    
    raise "dor"
    if user
      session[:user_id] = user.id

      if current_user.is_admin?
        redirect_to admin_articles_path, :notice => "Welcome Admin: " << user.email
      else
        redirect_to root_url, :notice => "Welcome " << user.email
      end
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
