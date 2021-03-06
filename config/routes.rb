Rails.application.routes.draw do

  devise_for :admins

  get 'welcome/index'
  match "/development" => "welcome#development", via: :get

  get 'galaxies/index_galaxy_citations'
  match 'admin' => "admin#index", via: [:get, :put]

  resources :galaxies do
    collection { post :import_galaxy, :import_galaxy_velocities }
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

  # used to redirect all unknown routes
  get '*path' => redirect('/')
end
