class UsersController < ApplicationController
  def new 
    @user = User.new 
  end 

  def create 
    @user = User.new(params[:user]) 
    if verify_recaptcha
      if @user.save 
        UserMailer.registration_confirmation(@user).deliver
        redirect_to log_in_path, :notice => "Signed up!" , :email => @user.email
      else 
        flash[:error] = "Invalid email or password" 
        render "new" 
      end 
    else
      flash[:error]= "Please fill the captcha" 
      render "new"
    end
  end 
end
