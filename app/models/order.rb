class Order < ApplicationRecord
  validates :total_amount, presence: true
end
