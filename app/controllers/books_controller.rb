class BooksController < ApplicationController

  def index
    @books = Book.all  
  end

  def new
    @book = Book.new
  end

  def create
		@book = current_user.books.new(book_params)

    # byebug
		@book.save!
		redirect_to @book
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update

  	@book = Book.find(params[:id])
		if @book.update(book_params)
			
			redirect_to @book
		else
			render :edit
		end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

	private
	def book_params
    # byebug
		params.require(:book).permit(:name, :price, :categories, :condition, :description, :prefered_location)
	end

end