class ChangeStringToInt < ActiveRecord::Migration
  def change
		change_column :point_transactions, :points, 'integer USING CAST(points AS integer)'
  end
end
