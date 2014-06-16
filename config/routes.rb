Rails.application.routes.draw do

  devise_for :admins

  get 'welcome/index'
  match 'admin' => "admin#index", via: [:get, :put]

  resources :galaxies do
    resources :measurements
    collection do
      match 'search' => 'galaxies#search', via: [:get, :post], as: :search
    end
  end

  resources :admin

  root to: "welcome#index"
end
