class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.text :description
      t.text :location
      t.integer :price

      t.timestamps
    end

    add_reference :orders, :event, foreign_key: true
  end
end
