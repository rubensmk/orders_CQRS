class OrderReadModel
  include Mongoid::Document
  include Mongoid::Timestamps

  field :order_id, type: Integer
  field :customer_name, type: String
  field :total_amount, type: Float

  index({ order_id: 1 }, { unique: true })
end
