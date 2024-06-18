module Queries
  class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
      orders = ReadOnly::Order.all

      readonly_orders = []

      orders.each do |order|
        serialized_order = {
          customer_name: order.customer_name,
          total_amount: order.total_amount
        }
        readonly_orders << serialized_order
      end
      render json: readonly_orders , status: :ok
    end
  end
end
