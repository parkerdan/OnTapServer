class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:notice] = "Logged In 🤗"
    else
      flash[:alert] = "**** You shall not pass!!!! ****"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:notice] = "Logged out!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
