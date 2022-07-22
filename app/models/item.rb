class Item < ApplicationRecord
  belongs_to :genre
  
  validates :image_id, presence: true
  validates :name, presence: true
  validates :explain, presence: true
  validates :genre_id, presence: true
#消費税を加えた商品価格のメソッド
    def add_tax_price
        (self.price * 1.10).round
    end
    
end
