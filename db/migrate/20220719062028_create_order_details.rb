class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id,    foreign_key: true
      t.integer :item_id,     foreign_key: true
      t.integer :sale_price,  null: false
      t.integer :quantity,    null: false
      t.integer  :item_status, null: false, default: 0

      t.timestamps
    end
  end
end
