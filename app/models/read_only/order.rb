class ReadOnly::Order
  include Mongoid::Document
  field :customer_name, type: String
  field :total_amount, type: Float
end
