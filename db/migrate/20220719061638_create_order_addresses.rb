class CreateOrderAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :order_addresses do |t|

      t.string :order_name, null: false
      t.string :post, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
