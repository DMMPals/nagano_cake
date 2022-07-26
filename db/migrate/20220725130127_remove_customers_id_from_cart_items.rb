class RemoveCustomersIdFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :customers_id, :integer
  end
end
