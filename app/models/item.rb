class Item < ApplicationRecord
  belongs_to :genre
  has_many :care_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_one_attached :image
  
  validates :name, presence: true
  validates :explain, presence: true
  validates :genre_id, presence: true
#消費税を加えた商品価格のメソッド
    def add_tax_price
        (self.price * 1.08).round
    end
    
end
