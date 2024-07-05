class ChangeOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :customer_name, :string

    add_column :orders, :status, :integer, default: 0
  end
end
