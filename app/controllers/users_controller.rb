class UsersController < ApplicationController
    def edit
    end
    
    def create
        @book =Book.new(book_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to book_path
    end
    
    def show
        @user = User.find(params[:id])
        @book = Book.new
        @books = @user.books
    end
    
    def index
    end
    
    private
    
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
