class CreateOrderAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :order_addresses do |t|
      t.references :order_id, foreign_key: true
      t.string :order_name, null: false
      t.string :post, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
