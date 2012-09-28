class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    # if verify_recaptcha
      if user
        session[:user_id] = user.id
        # UserMailer.registration_confirmation(user).deliver
        redirect_to root_url, :notice => "Welcome " << user.email
      else
        flash[:error] = "Invalid email or password" 
        render "new"
      end
    # else
    #   flash[:error]= "Please fill the captcha" 
    #   render "new"
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to log_in_path, :notice => "Logged out!"
  end  

end
