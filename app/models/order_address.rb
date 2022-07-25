class OrderAddress < ApplicationRecord
  belongs_to :customer
  def address_display
  '〒' + post + ' ' + address + ' ' + order_name
  end
end
