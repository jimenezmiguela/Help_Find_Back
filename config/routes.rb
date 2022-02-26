
# UPDATED
Rails.application.routes.draw do
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


# ORIGINAL
# Rails.application.routes.draw do
#   devise_for :users
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end
