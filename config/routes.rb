Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    rergistration: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :studios, only: [:index, :show, :create, :destroy] do
        resources :reservations, only: [:create, :destroy]
      end
      resources :reservations, only: [:index]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
