Rails.application.routes.draw do
  namespace :report do
    resources :reports, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
