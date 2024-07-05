class OrderReadModel
  include Mongoid::Document
  include Mongoid::Timestamps

  field :order_id, type: Integer
  field :status, type: String
  field :total_amount, type: Float

  index({ order_id: 1 }, { unique: true })
end
