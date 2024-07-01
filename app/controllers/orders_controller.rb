class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    CreateOrderService.new.call(order_params)
    render json: { status: 'Order created' }, status: :created
  end

  def index
    orders = OrderReadModel.all
    render json: orders
  end

  def show
    order = OrderReadModel.find_by(order_id: params[:id])
    render json: order
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :total_amount)
  end
end
