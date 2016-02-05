class AddDonateAmountToUser < ActiveRecord::Migration
  def change
    add_column :users, :donate_amount, :integer, default:0
  end
end
