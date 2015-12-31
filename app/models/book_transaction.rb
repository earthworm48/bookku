class BookTransaction < ActiveRecord::Base
	belongs_to :users
	belongs_to :books
end
