class OrderCreatedHandler
  def call(event)
    OrderReadModel.create!(order_id: event.data[:order_id], total_amount: event.data[:total_amount])
  rescue => e
    Rails.logger.error "Failed to create OrderReadModel: #{e.message}"
  end
end
