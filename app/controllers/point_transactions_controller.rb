class PointTransactionsController < ApplicationController
	def new
		@client_token = generate_client_token
		@point_transaction = PointTransaction.new 
	end

	def create

		points = params[:point_transaction][:points].to_i
		@transaction = current_user.point_transactions.new
		@transaction.points = points
		result = Braintree::Transaction.sale(
		  amount: "#{points}",
		  payment_method_nonce: params[:payment_method_nonce]
		)

		if result.success?
			@transaction.user.points += points
			@transaction.user.save
			@transaction.save
			redirect_to current_user, notice: "Congraulations! Your transaction has been successfully!"
		else
			redirect_to root_path, aler: "Your transaction failed! Please try it again"
		end
	end

	def generate_client_token
		Braintree::ClientToken.generate
	end
end
