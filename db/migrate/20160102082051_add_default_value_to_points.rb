class AddDefaultValueToPoints < ActiveRecord::Migration
	def up
	  change_column :users, :points, :integer, :default => 100
	end

	def down
	  change_column :users, :points, :integer, :default => 0
	end
end
