class CreateBookTransactions < ActiveRecord::Migration
  def change
    create_table :book_transactions do |t|
    	t.integer :user_id
    	t.integer :book_id
    	t.string :status
    end
  end
end
