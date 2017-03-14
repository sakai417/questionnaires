Rails.application.routes.draw do

  root to: 'companies#index'
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
