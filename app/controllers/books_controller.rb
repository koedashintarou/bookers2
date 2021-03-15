class BooksController < ApplicationController

  before_action :authenticate_user!
  before_action :baria_user, only: [:edit, :destroy, :update]


 def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
    @book_comment = BookComment.new


 end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user



  end

  def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
      if @book.save


          redirect_to book_path(@book.id), notice: 'Book was successfully created.'
      else
          @books = Book.all
          @user = current_user
          render :index
      end
  end



  def top

  end



  def edit
     @book = Book.find(params[:id])
  end
  
  def comments
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
       redirect_to book_path(@book), notice: 'You have updated book successfully.'
    else
      render :edit
    end

    # redirect_to book_path(@book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def baria_user
    unless Book.find(params[:id]).user.id.to_i == current_user.id
        redirect_to books_path
    end
  end
end