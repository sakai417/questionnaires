Rails.application.routes.draw do
  resources :companies do
    devise_for :users, controllers: {
      sessions:      'users/sessions',
      passwords:     'users/passwords',
      registrations: 'users/registrations'} do
      match "companies/:company_id/sign_up" => "users/registrations#new", as: new_user_company_registration
    end
  end

  root to: 'companies#index'
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
