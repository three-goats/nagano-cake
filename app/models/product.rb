class Product < ApplicationRecord
  #商品の画像 refile メソッド
	attachment :image

	belongs_to :products_type, optional: true
	has_many :order_products

end
