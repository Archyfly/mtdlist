Rails.application.routes.draw do
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  devise_for :users

  delete :logout, to: 'sessions#destroy'

  resources :users do
    resources :projects do
      patch :update_inline, on: :member
      resources :tasks do
        patch :update_task_inline, on: :member
      end
    end
  end


end
