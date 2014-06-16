Rails.application.routes.draw do

  devise_for :admins
  get 'welcome/index'

  resources :galaxies do
    resources :measurements
    collection do
      match 'search' => 'galaxies#search', via: [:get, :post], as: :search
    end
  end

  root to: "welcome#index"
end
