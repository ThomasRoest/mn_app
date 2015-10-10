class AddMonthlyToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :each_month, :boolean
  end
end
