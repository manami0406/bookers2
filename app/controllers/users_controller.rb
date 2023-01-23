class UsersController < ApplicationController
    def show
         @user = User.find(params[:id])
         @books = @user.books
         @book = Book.new
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end
    
        
    def index
        @user = current_user
        @book = Book.new
        @users = User.all
    end

    private
    
    def book_params
        params.require(:book).permit(:title, :body)
    end
    
    def user_params
        params.require(:user).permit(:name, :image, :introduction)
    end

end
