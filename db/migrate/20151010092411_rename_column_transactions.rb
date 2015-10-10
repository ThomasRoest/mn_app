class RenameColumnTransactions < ActiveRecord::Migration
  def change
    rename_column :transactions, :each_month, :fixed_transaction
  end
end
