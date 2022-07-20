class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,   foreign_key: true
      t.integer :payment,       null: false
      t.integer :postage,       null: false
      t.integer :payment_price, null: false
      t.string  :post,          null: false
      t.text    :address,       null: false
      t.string  :name,          null: false
      t.integer :order_status,  null: false


      t.timestamps
    end
  end
end
