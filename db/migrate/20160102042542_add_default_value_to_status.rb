class AddDefaultValueToStatus < ActiveRecord::Migration
	def up
	  change_column :book_transactions, :status, :string, :default => "pending"
	end

	def down
	  change_column :book_transactions, :status, :string, :default => nil
	end
end
