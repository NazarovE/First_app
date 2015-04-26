class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    if !logged_in?
      redirect_to root_path
    else
      #@user=User.find(params[:id])
      @user=User.find(@current_user.id)
    end
  end
  
  def edit
    if !logged_in?
      redirect_to root_path
    else
      #@user = User.find(params[:id])
      @user=User.find(@current_user.id)
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :surname, :email, :password,
                                   :password_confirmation)
    end
end
