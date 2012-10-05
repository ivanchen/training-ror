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

  def show
    id = params[:id]
    @users = User.find(id);
    if @users.nil?
      redirect_to articles_path, :notice => "Mohon maaf, kami tidak menemukan user yang Anda cari"
    end
  end

  def edit
    id = params[:id]
    @user = User.find(id);
    @status = "edit"
    if current_user.id !=@user.id
        redirect_to root_path, :notice => "Anda tidak memiliki hak untuk memperbaharui profile "<<@user.name
    end
  end

  def update
    id = params[:id]
    @user = User.find(id);
    # raise current_user.id
    if current_user.id == @user.id
      status = @user.update_attributes(params[:user])
      if status
        redirect_to root_path, :notice => "Data profile "<<params[:user][:name]<<" berhasil diperbaharui"
      else
        redirect_to root_path, :notice => "Data profile "<<params[:user][:name]<<" gagal diperbaharui"
      end
    else
        redirect_to root_path, :notice => "Anda tidak memiliki hak untuk memperbaharui profile "<<@user.name
    end

  end

  def is_admin?
    if self.email=="admin@admin.com"
      return true
    else 
      return false
    end
  end
end
