class Account < ActiveRecord::Base
  has_many :transactions
  # after_save :update_balance!


   def update_balance!
    update_attributes(
      balance: self.transactions.sum(:amount)
      )
    # self.balance = self.account_entries.sum(:amount)
  end
end
