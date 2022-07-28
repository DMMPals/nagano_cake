class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :items,through: :order_details
  enum payment: { credit_card: 0, transfer: 1 }

  #入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4
  enum order_status: { waiting_pay: 0, confirm_payment: 1, working:2, ready_to_ship:3, sent:4 }
end
