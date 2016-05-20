Rails.application.routes.draw do

  namespace :admin do
    resources :job_openings
  end

  devise_for :users
  root 'home#index'
end
