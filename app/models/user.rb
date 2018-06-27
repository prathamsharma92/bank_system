class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :transactions, dependent: :destroy

		# Validations
  validates :pin, presence: true, length: { in: 4..6 }
  validates :amount, numericality: {greater_than_or_equal_to: 0.0}

  def update_account_balance(t_type, amount)
  	if (t_type == "Deposit")
  		new_amount = (self.amount + amount)
  		self.update_attributes(amount: new_amount)
  	elsif (t_type == "Withdraw")
  		new_amount = (self.amount - amount)
  		self.update_attributes(amount: new_amount)
  	end
  end

end
