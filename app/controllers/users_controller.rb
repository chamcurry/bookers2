class UsersController < ApplicationController
  def index
    @users =User.all
    @book = Book.new
  end
  def show
    @user =User.find(params[:id])
    @books = @user.books
    @book =Book.new
  end

  def edit
    @user =User.find(params[:id])
   if @user == current_user
    render :edit
   else
    redirect_to user_path(current_user)
   end
  end
  def update
   @user =User.find(params[:id])
   if @user.update(user_params)
     redirect_to user_path,notice: "You have updated book successfully."
   else
    render :edit
   end
  end
  private
  def user_params
   params.require(:user).permit(:name,:introduction,:profile_image)
  end
end