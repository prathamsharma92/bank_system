class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.float :amount, default: 0.0
      t.integer :transaction_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
