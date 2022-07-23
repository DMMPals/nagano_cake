class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :image
  
  validates :name, presence: true
  validates :explain, presence: true
  validates :genre_id, presence: true
#消費税を加えた商品価格のメソッド
    def add_tax_price
        (self.price * 1.10).round
    end
    
end
