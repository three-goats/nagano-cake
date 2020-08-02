Rails.application.routes.draw do

	root "admins/orders#top"

  namespace :members do
    get 'destinations/index'
    get 'destinations/edit'
    resources :destinations, only: [:index, :edit]
  end

  namespace :members do
    get 'orders/index'
    get 'orders/show'
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/success'
    resources :orders, only: [:index, :show, :new, :confirm, :success]
  end
  
  namespace :members do
    get 'baskets/index'
    resources :baskets, only: [:index]
  end
  namespace :members do
    get 'products/index'
    get 'products/show'
    resources :products, only: [:index, :show]
  end
  namespace :members do
    get 'members/show'
    get 'members/edit'
    get 'members/leave'
    resources :members, only: [:show, :edit, :leave]
  end
  namespace :members do
    get 'homes/top'
    get 'homes/about'
    resources :homes, only: [:top, :about]
  end
  namespace :admins do
    get 'members/index'
    get 'members/show'
    get 'members/edit'
  end
  namespace :admins do
    get 'productstypes/index'
    get 'productstypes/edit'
  end
  namespace :admins do
    get 'products/index'
    get 'products/new'
    get 'products/show'
    get 'products/edit'
  end
  namespace :admins do
    # get 'orders/top'
    get 'orders/index'
    get 'orders/show'
  end
	devise_for :admins, controllers: {
  		sessions:      'admins/sessions',
  		passwords:     'admins/passwords',
  		registrations: 'admins/registrations'
	}

	devise_for :members, controllers: {
  		sessions:      'members/sessions',
  		passwords:     'members/passwords',
  		registrations: 'members/registrations'
	}




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
