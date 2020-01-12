Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :currencies, except: [:show]

  post '/converter', to: 'converter#create'

  resources :rates, only: [:index] do
    collection do
      get 'results'
    end
  end

  root 'converter#index'
end
