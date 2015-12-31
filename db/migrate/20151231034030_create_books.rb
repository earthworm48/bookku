class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :price
      t.string :categories
      t.string :condition
      t.string :description
      t.string :prefered_location

      t.timestamps null: false
    end
  end
end
