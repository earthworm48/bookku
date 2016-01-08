class ChangeRatingFromIntegerToFloat < ActiveRecord::Migration
  def change
  	change_column :books, :rating_average, :float
  end
end
