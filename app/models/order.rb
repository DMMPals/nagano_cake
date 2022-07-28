class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :items,through: :order_details
  enum payment: { credit_card: 0, transfer: 1 }
  enum order_status: { no_payment: 0, confirm_payment: 2, production: 3, ready_to_ship: 4, sent: 5 }
end
