Rails.application.routes.draw do
  get '/robots.txt', to: 'robots#show', as: :robots

  mount Ckeditor::Engine => '/ckeditor'
  authenticate :user do
    namespace :admin do
      DashboardManifest::DASHBOARDS.each do |dashboard_resource|
        resources dashboard_resource
      end
      resources :blogs
      root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
    end
  end

  root 'pages#index'
  get  '/about'    => 'pages#about'
  get  '/contacts' => 'pages#contacts'
  get  '/products' => 'pages#products'
  post '/feedback' => 'pages#feedback'
  resources :stocks
  resources :projects
  resources :products, only: [:show]
  resources :blogs, only: %i[show index] do
    post :search, on: :collection
  end
  devise_for :users
end
