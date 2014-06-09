Rails.application.routes.draw do

  resources :galaxies do
    resources :measurements
    collection do
      match 'search' => 'galaxies#search', via: [:get, :post], as: :search
    end
  end

  root to: "galaxies#index"
end
