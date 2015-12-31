class ChangeTableName < ActiveRecord::Migration
	rename_table :models, :users
end
