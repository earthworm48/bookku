class UsersController < ApplicationController

	before_action :authenticate_user!
	
	def show
	  	@user = User.find(params[:id])
	  	@book_transactions = []
	  	
	  	BookTransaction.all.each do |book_transaction|
	  		if current_user.id == book_transaction.user_id || current_user.id == book_transaction.book.user_id
	  			@book_transactions << book_transaction
	  		end	
	  	end
	end

end