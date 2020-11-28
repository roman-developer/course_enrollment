Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :enrollments
  resources :courses do
    post :vote, on: :member
  end
  resources :teachers do
    post :vote, on: :member
  end

  root 'enrollments#index'
end
