module Commands
  class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def create
      mysql_order = Order.new(order_params)

      if mysql_order.save
        mongo_order = ReadOnly::Order.new(order_params)
        mongo_order.save

        render json: { status: true, message: 'Order created successfully' }, status: :ok
      else
        render json: { status: false, message: 'Failed to create order' }, status: :unprocessable_entity
      end
    end

    private

    def order_params
      params.require(:order).permit(:customer_name, :total_amount)
    end
  end
end
