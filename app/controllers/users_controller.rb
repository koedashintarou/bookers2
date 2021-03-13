class UsersController < ApplicationController

  before_action :authenticate_user!

 def show
    @users = User.all
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all

 end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user

  end

  def create
        @book = Book.new(book_params)
        @user = User.new(user_params)
      if @book.save

          redirect_to book_path(@book.id), notice: 'Book was successfully created.'
      else
          @books = Book.all
          render :index
      end

      if @user.save

          redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
      else
          @users = user.all
          render :index
      end
  end



  def top

  end



  def edit
     @user = User.find(params[:id])
     if @user != current_user
       redirect_to user_path(current_user)
     end

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end


  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end



end