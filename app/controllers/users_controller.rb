class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
  	@users = User.all
  	@book = Book.new
  	@user = User.find(current_user.id)
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
    else
       redirect_to user_path(current_user)
       @book = Book.new
       @books = @user.books.page(params[:page]).reverse_order
    end
  end


  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	   flash[:notice] = "You have updated user successfully!"
  	   redirect_to user_path(@user.id)
  	  else
  	   render :edit
  	end
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end


  private

  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
