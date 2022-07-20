class CreateOrderAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :order_addresses do |t|
      t.references :customer_id, foreign_key: true

      t.timestamps
    end
  end
end
