require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe 'POST #create' do
    it 'calls CreateOrderService with order_params' do
      order_params = { total_amount: '100' }

      expect_any_instance_of(CreateOrderService).to receive(:call).with(ActionController::Parameters.new(order_params).permit(:total_amount))

      post :create, params: { order: order_params }, format: :json
      expect(response).to have_http_status(:created)
      expect(response.body).to eq({ status: 'Order created' }.to_json)
    end
  end

  describe 'GET #index' do
    it 'returns a list of orders' do
      orders = [
        { id: 1, total_amount: 50 },
        { id: 2, total_amount: 75 }
      ]

      allow(OrderReadModel).to receive(:all).and_return(orders)

      get :index, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
      expect(JSON.parse(response.body).map { |order| order['total_amount'] }).to contain_exactly(50, 75)
    end
  end

  describe 'GET #show' do
    it 'returns the specified order' do
      order = { id: 3, total_amount: 150 }

      allow(OrderReadModel).to receive(:find_by).with(order_id: '3').and_return(order)

      get :show, params: { id: '3' }, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['total_amount']).to eq(150)
    end
  end
end
