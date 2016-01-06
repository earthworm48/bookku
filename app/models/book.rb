class Book < ActiveRecord::Base
	has_one :book_transaction
	belongs_to :user
	
	searchkick
end
