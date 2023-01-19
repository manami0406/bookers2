class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to root_path
  end

  def index
    @books = Book.all
    
    # @user = User.find(params[:id])
  end

  def show
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
