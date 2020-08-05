class ApplicationController < ActionController::Base
	# (りのじ)_members/sign_upの際にemail.pasword以外にもカラムを追加するので
	before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name,
       :last_kana_name, :first_kana_name, :post_number, :telephone_number, :address,
        :member_status, :email])
 	end
end
