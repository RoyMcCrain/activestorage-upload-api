Rails.application.routes.draw do
  post "api/reports/create"

  namespace :report do
    resources :reports
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
