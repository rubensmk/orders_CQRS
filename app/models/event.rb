class Event < ApplicationRecord
  has_many :orders, dependent: :destroy
end
