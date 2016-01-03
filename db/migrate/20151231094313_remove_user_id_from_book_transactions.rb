class RemoveUserIdFromBookTransactions < ActiveRecord::Migration
  def change
    remove_column :book_transactions, :user_id, :integer
  end
end
