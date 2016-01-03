class RemoveBookIdFromBookTransactions < ActiveRecord::Migration
  def change
    remove_column :book_transactions, :book_id, :integer
  end
end
