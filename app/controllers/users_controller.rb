class UsersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @users = User.includes(:profile) 
  end
 
 
 
  # GET to /users/:id
  def show
    @user = User.find( params[:id] )
    @posts = current_user.posts.order(created_at: :desc)
  end
  
private
  def profile_params
    params.require(:user).permit(:avatar)
  end


  
  
  
end
