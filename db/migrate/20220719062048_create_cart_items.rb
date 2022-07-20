class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :customer, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
