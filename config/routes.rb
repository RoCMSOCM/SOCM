Rails.application.routes.draw do

  devise_for :admins

  get 'welcome/index'
  match 'admin' => "admin#index", via: [:get, :put]

  resources :galaxies do
    resources :velocities
    collection do
      match 'search' => 'galaxies#search', via: [:get, :post], as: :search
    end
  end

  resources :citations do
    collection do
      match 'search' => 'citations#search', via: [:get, :post], as: :search
    end
  end

  resources :admin

  root to: "welcome#index"
end
