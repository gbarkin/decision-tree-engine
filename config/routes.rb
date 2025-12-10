Rails.application.routes.draw do
  root "home#index"   # or pages#home – whatever your hero page uses

  resources :workflows do
    member do
      post :start_run
    end
    resources :questions, only: [:new, :create]
  end

  resources :questions, only: [:edit, :update, :destroy] do
    resources :answer_options, only: [:new, :create]
  end

  resources :answer_options, only: [:edit, :update, :destroy]

  resources :workflow_runs, only: [:show] do
    member do
      post :answer
    end
  end
end
