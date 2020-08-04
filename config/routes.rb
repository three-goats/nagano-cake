Rails.application.routes.draw do
  root 'admins/orders#top'
  namespace :members do
    resources :destinations, only: [:index, :edit]
    resources :orders, only: [:index, :show, :new, :confirm, :success]
    resources :baskets, only: [:index]
    resources :products, only: [:index, :show]
    resources :members, only: [:show, :edit, :leave]
    resources :homes, only: [:top, :about]
   end
  namespace :admins do
    resources :members, only: [:index, :show, :edit]
    resources :productstypes, only: [:index, :edit, :create, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show]
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
end