
# UPDATED
Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/test', to: 'test#show'

  namespace :api do
    namespace :v1 do
      resources :missing_persons do
        resources :status_reports
      end
      resources :fbi, only: :index
      resources :twitter, only: :index
      resources :newsdata, only: :index
    end
  end
end
