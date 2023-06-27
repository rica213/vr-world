Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    rergistration: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :studios, only: [:index, :show, :create, :destroy] do
        resources :reservations, only: [:index, :create, :destroy]
      end
    end
  end
  root to: redirect('/api-docs')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
