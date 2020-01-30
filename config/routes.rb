Rails.application.routes.draw do
  get 'record_pdfs/index'

  devise_for :users
  root 'users#index'
  resources :users, only: [:edit, :update]
  resources :parts, only: [:index, :new, :create, :show, :edit, :update,:destroy]
  resources :machines do
    resources :parts, only: [:index, :show,:edit,:update]
  end
  resources :machines do
    resources :images, only: :show
  end
  resources :machines, only: [:new, :create, :edit, :show, :update, :destroy] do
    resources :repairs, only: [:index, :show, :new, :create,:destroy]
  end
  resources :repairs, only: [:edit, :update]
  resources :repairs, only: [:edit, :update] do
    resources :record_pdfs, only: [:index]
  end
  resources :record_pdfs, only: [:index]
end
