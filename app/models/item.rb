class Item < ApplicationRecord
    
#消費税を加えた商品価格のメソッド
    def add_tax_price
        (self.price * 1.10).round
    end
    
end
