Foreningflex::Application.routes.draw do

  root to: 'pages#root'

  resource :user_session
  
  match 'login'   => 'user_sessions#new',     :as => :login
  match 'logout'  => 'user_sessions#destroy', :as => :logout

  resource :account, :controller => "users"
  
  scope 'bruger' do
    match 'udmeld' => 'users#resign', :as => "resign/users"
    match ':id/udmeld' => 'users#resign', :as => "resign/user"
  end

  scope 'sider' do
    match 'om'      => 'pages#about', :as => :about
    match 'kontakt' => 'pages#contact', :as => :contact
    match 'demo'    => 'pages#demo', :as => :demo
  end

  match 'indstillinger' => 'clubs#edit', :as => :edit

  resource :pages do
    post :demo_popup
  end  

  # match 'sign_up' => 'registrations#new',              via: :get,  as: :sign_up
  # match 'sign_up' => 'registrations#create',           via: :post, as: :sign_up
  # match 'activate/:token' => 'registrations#activate', via: :get,  as: :activation

  # match 'forgotten_password' => 'password_resets#new',     via: :get,  as: :forgotten_password
  # match 'forgotten_password' => 'password_resets#create',  via: :post, as: :forgotten_password
  # match 'reset_password/:token' => 'password_resets#edit', via: :get,  as: :reset_password
  # match 'reset_password/:id' => 'password_resets#update',  via: :put

end
