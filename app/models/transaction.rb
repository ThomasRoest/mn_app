class Transaction < ActiveRecord::Base
  belongs_to :account
  validates :description, presence: true
  validates :amount, presence: true
  after_save :update_account_balance!
  after_destroy :update_account_balance!

  #through associations
  def update_account_balance!
    account.update_balance!
  end
end
