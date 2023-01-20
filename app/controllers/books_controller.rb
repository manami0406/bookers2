class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to root_path
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end
  
  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
  
end
