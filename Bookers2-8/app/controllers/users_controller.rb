class UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :edit_user, only: [:edit, :update]

  def index  
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @users = User.all
    @booknew = Book.new
    @books = @user.books
  end

  def new
    @book = Book.new
  end
  
  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "user was successfully updated"
    else
      render "edit"
    end
  end


private
def book_params
  params.require(:book).permit(:title, :body)
end  

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

  def edit_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

end
