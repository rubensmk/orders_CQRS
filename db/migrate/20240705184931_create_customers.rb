class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :image_url

      t.timestamps
    end

    add_reference :orders, :customer, foreign_key: true
  end
end
