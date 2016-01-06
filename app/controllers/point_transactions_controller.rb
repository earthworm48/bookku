class PointTransactionsController < ApplicationController
	def new
		@client_token = generate_client_token
	end
	
	def create
		@transaction = current_user.point_transactions.new
		@transaction.points = params[:value]
		result = Braintree::Transaction.sale(
		  amount: "#{@transaction.points}",
		  payment_method_nonce: params[:payment_method_nonce]
		)
		if result.success?
			@transaction.user.points += @transaction.points
			@transaction.user.save
			@transaction.save
			redirect_to root_path, notice: "Congraulations! Your transaction has been successfully!"
		else
			redirect_to root_path, aler: "Your transaction failed! Please try it again"
		end

	end

	def generate_client_token
		Braintree::ClientToken.generate
	end
end
