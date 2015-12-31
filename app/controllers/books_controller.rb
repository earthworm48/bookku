class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
		@book = Book.new(book_params)
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
			byebug
			redirect_to @book
		else
			render :edit
		end
  end

	private
	def book_params
		params.require(:book).permit(:name, :price, :categories, :condition, :description, :prefered_location)
	end

end