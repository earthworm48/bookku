class AddBookRefToBookTransactions < ActiveRecord::Migration
  def change
    add_reference :book_transactions, :book, index: true, foreign_key: true
  end
end
