class ApplicationController < ActionController::Base
	# (りのじ)_members/sign_upの際にemail.pasword以外にもカラムを追加するので
	 before_action :configure_permitted_parameters, if: :devise_controller?

	 # 下記のコードは注文_商品機能で使用
	 protect_from_forgery with: :exception

	 helper_method :current_order_product

	 def current_order_product
	 	if session[:order_products_id]
	 	 @order_product = OrderProduct.find(session[:order_products_id])
	 	else
	 	 @order_product = OrderProduct.create
	 	 session[:order_products_id] = @order_product.id
	 	end
	 end
	 # 注文_商品機能ここまで

  
	protected
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,
       :last_kana_name, :first_kana_name, :post_number, :telephone_number, :address,
        :member_status, :email])
 	end
end
