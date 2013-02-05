Setminton::Application.routes.draw do
  root :to => 'home#index'

  resource :user_session do
    member do
      match 'load/:id' => 'user_sessions#load_user_from_perishable_token', :as => :load
    end
  end
  
  match 'login'   => 'user_sessions#new',     :as => :login
  match 'logout'  => 'user_sessions#destroy', :as => :logout
  
  resource :account, :controller => "users"

  resources :users 

  resources :authentications
  match '/auth/:provider/callback' => 'authentications#create'
  
  match 'om'      => 'pages#about', :as => :about
  match 'kontakt' => 'pages#contact', :as => :contact
  match 'demo'    => 'pages#demo', :as => :demo

  match 'udmeld'  => 'users#resign', :as => :resign

  match 'indstillinger' => 'clubs#edit', :as => :edit

  resource :pages do
    post :demo_popup
  end
end
