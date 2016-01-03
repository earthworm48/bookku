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
end
