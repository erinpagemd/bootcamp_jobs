Rails.application.routes.draw do

  namespace :admin do
    resources :job_openings
    resources :submissions do
      member do
        put :admin_reject
      end
    end
  end

  resources :job_openings

  resources :submissions

  devise_for :users
  root 'home#index'
end
