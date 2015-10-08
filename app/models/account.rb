class Account < ActiveRecord::Base
  has_many :transactions, dependent: :destroy
  validates :name, presence: true

  
   def update_balance!
    debit = self.transactions.where(transaction_type: "debit").sum(:amount)
    credit = self.transactions.where(transaction_type: "credit").sum(:amount)
    
    update_attributes(
      balance: debit - credit
      )
    # self.balance = self.account_entries.sum(:amount)
  end
end
