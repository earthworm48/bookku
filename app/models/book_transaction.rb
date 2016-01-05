class BookTransaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :book

	validate do |user|
    	user.must_be_greater_than_book_price
  	end

  def must_be_greater_than_book_price
    errors.add(:base, "You don't have enough price") if user.points < book.price 
  end
end
