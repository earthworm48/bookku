
class BookTransactionsController < ApplicationController
  

  def create
  	byebug
  	@book_transaction = current_user.book_transactions.new(book_transaction_params)
    byebug
    if @book_transaction.save
      @book_transaction.user.points -= @book_transaction.book.price
      @book_transaction.user.save!
    else
      @errors = @book_transaction.errors
    end
    redirect_to current_user
  end

  def destroy
  	@book_transaction = BookTransaction.find(params[:id])
  	
    if @book_transaction.destroy
      @book_transaction.user.points += @book_transaction.book.price    
      @book_transaction.user.save!
    end
  	redirect_to current_user	
  end

  def successful_transaction
    book_transaction = BookTransaction.find(params[:format])
    book_transaction.book.user.points += book_transaction.book.price   
    book_transaction.book.user.save!

    book_transaction.status = 'successful'
    book_transaction.save!

    redirect_to current_user
  end

  private
  def book_transaction_params
  	params.require(:book_transaction).permit(:book_id)
  end
end