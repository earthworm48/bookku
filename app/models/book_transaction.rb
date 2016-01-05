class BookTransaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :book

	before_save :point_validation

	def point_validation
		# byebug
		if user.points < book.price
			reject transaction
		end
	end

	validate do |user|
    	user.must_be_greater_than_book_price
  	end

  def must_be_greater_than_book_price
    errors.add(:base, "You don't have enough price") if user.points < book.price 
    byebug
  end
end
