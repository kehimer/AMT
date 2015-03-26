class SessionsController < ApplicationController
	kip_before_filter :authenticate 

  def new
    if current_user.present?
      redirect_to clients_path
    end
  end

  def create
    email = params[:session][:email]
    pass = params[:session][:password]

    @user = User.find_by_email(email)

    if @user.present? && @user.authenticate(pass)
      login(@user)
    else
      redirect_to login_path, flash: {notice: "User Email or Password is Incorrect"}
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
