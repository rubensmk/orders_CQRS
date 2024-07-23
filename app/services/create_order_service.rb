class CreateOrderService
  def call(order_params)
    ActiveRecord::Base.transaction do
      order = Order.create!(order_params)

      event = OrderCreated.new(data: { order_id: order.id, total_amount: order.total_amount,
                                       status: order.status, customer_id: order.customer_id, event_id: order.event_id })
      Rails.configuration.event_store.publish(event, stream_name: "Order$#{order.id}")
    end
  end
end
