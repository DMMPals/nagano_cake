class OrderAddress < ApplicationRecord
  belongs_to :customer

  validates :order_name, presence: true
  validates :post, presence: true
  validates :address, presence: true
end
