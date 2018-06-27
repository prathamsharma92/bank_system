class Transaction < ApplicationRecord
  # Associations
  belongs_to :user

  enum transaction_type: ["Deposit", "Withdraw"]

	# Validations
  validates :amount, numericality: {greater_than: 0.0}
  validates :transaction_type, presence: true

  # Callbacks
  before_save :update_account_balance

  private
  
  def update_account_balance
  	if self.transaction_type == "Deposit"
  		self.user.update_account_balance("Deposit", self.amount)
  	else
  		self.user.update_account_balance("Withdraw", self.amount)
  	end
  end

end
