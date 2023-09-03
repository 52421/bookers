class BooksController < ApplicationController
  def new
    @booknew = Book.new
  end

  def index
     @booknew = Book.new
     @books = Book.all
  end


  def create
    @booknew = Book.new(books_params)
    @books = Book.all
    if @booknew.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@booknew.id)
    else
      flash.now[:alert] = "errors prohibited this book from being saved."
      render :index
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
       flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:success] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end