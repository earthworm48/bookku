class CreatePointTransactions < ActiveRecord::Migration
  def change
    create_table :point_transactions do |t|
    	t.string :user_id
    	t.string :points
      t.timestamps null: false
    end
  end
end
