class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum item_status: { no_making: 0, waiting: 1, making: 2, complete: 3 }
  
  validates :item_status, inclusion: { in: OrderDetail.item_status.keys }

end
