Rails.application.routes.draw do

  namespace :admin do
    resources :job_openings
  end

  resources :job_openings

  resources :submissions

  devise_for :users
  root 'home#index'
end
