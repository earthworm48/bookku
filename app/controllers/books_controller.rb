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

	private
	def listing_params
		params.require(:book).permit(:name, :price, :categories, :condition, :description, :prefered_location).merge(user_id: current_user.id)
	end

end