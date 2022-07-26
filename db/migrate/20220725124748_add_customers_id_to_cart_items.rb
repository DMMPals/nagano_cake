class AddCustomersIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :customers_id, :integer
  end
end
