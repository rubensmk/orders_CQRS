class Order < ApplicationRecord
  enum status: { pending: 0, waiting_payment: 1, approved: 2 }

  validates :total_amount, presence: true

  belongs_to :customer
end
