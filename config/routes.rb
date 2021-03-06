Rails.application.routes.draw do

  namespace :admin do
    resources :job_openings
    resources :submissions do
      member do
        put :admin_reject
        put :admin_contact
        put :admin_interview
        put :admin_hired
      end
    end
  end

  resources :job_openings

  resources :phone_numbers

  resources :submissions

  resource :profile, only: [:edit, :update]

  devise_for :user
  root 'home#index'
end
