class HomeController < ApplicationController
	def index
		@book = Book.all
		@book_new = @book.order('created_at ASC')
		@book_rating = @book.order('rating_average DESC')
	end
end

