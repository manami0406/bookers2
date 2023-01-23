class UsersController < ApplicationController
    def show
         @user = User.find(params[:id])
         @books = @user.books
         @book = Book.new
    end
    
    def edit
        is_matching_login_user
        user_id = params[:id].to_i
        unless user_id == current_user.id
            redirect_to users_path
        end
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          flash[:notice] = "You have updated user successfully."
          redirect_to user_path(@user.id)
        else
          render :edit
        end
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
