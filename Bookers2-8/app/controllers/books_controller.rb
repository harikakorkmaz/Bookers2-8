class BooksController < ApplicationController
  
  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :update]

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
    @booknew = Book.new
    @user = @book.user
    @users = User.all
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully"
    else
      @books = Book.all
      @users = User.all
      @user = current_user
      render action: :index
    end
  end
    
  def edit
    @book = Book.find(params[:id])
    
  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
      if @book.save
        redirect_to book_path(@book), notice: "You have updated book successfully."
      else
        render action: :edit
      end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book), notice: "Book was succesfully destroyed."
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end 


  def baria_user
    unless Book.find(params[:id]).user.id.to_i == current_user.id
      redirect_to books_path
    end
  end

end
