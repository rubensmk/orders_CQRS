class OrderCreatedHandler
  def call(event)
    create_new_read_order!(event)
  rescue => e
    Rails.logger.error "Failed to create OrderReadModel: #{e.message}"
  end

  private

  def create_new_read_order!(event)
    OrderReadModel.create!(
      order_id: event.data[:order_id],
      total_amount: event.data[:total_amount],
      status: event.data[:status],
      customer_id: event.data[:customer_id],
      event_id: event.data[:event_id]
    )
  end
end
