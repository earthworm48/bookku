class AddUserRefToBookTransactions < ActiveRecord::Migration
  def change
    add_reference :book_transactions, :user, index: true, foreign_key: true
  end
end
