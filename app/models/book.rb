class Book < ActiveRecord::Base
	has_many :book_transactions
	belongs_to :user
end
