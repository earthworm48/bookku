class UsersController < ApplicationController

	before_action :authenticate_user!

	def show
	  	@user = User.find(params[:id])
		@sellList = Book.where(user_id:current_user.id)
		@buyList = BookTransaction.where(user_id:current_user.id,status:"pending")
		@historyList = BookTransaction.where(status:"successful")
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			redirect_to @user, alert: "Wrong edit"
		end
	end

	def donate
		@user = User.find(params[:user_id])
		donate_amount = params[:user][:donate_amount].to_i
		if donate_amount <= @user.points
			@user.donate_amount += donate_amount
			@user.points -= donate_amount
			@user.save!
			redirect_to @user
		else
			redirect_to @user, alert: "You do not have enough points to do so!"
		end

	end


	private
	def user_params
		params.require(:user).permit(:username, :postal, :email)
	end

end
