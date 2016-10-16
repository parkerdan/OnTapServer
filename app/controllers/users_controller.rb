class UsersController < ApplicationController
  # GET /users
  # GET /users.json

  # GET /users/1
  # GET /users/1.json
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to "https://brewcards.herokuapp.com/charges/new", notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      @user = current_user
      if @user.authenticate(params[:user][:current_password])
        if @user.update user_params
          redirect_to edit_users_path, notice: "Profile updated"
        else
          flash[:alert] = "See errors below"
          render :edit
        end
      else
        flash[:alert] = "Wrong password"
        render :edit
      end
    end
  # DELETE /users/1
  # DELETE /users/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
