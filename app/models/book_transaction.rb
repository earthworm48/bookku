class BookTransaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :book

	validate do |user|
    	user.point_must_be_greater_than_book_price
  end

  def point_must_be_greater_than_book_price
  	# byebug
    errors.add(:base, "You don't have enough points") if user.points < book.price 
   	# @errors = errors
  end

end
