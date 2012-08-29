ColemanConnection::Application.routes.draw do
  
  mount Flair::Engine => "/flair" if Rails.env.development?
  
  match '/pathway', to: 'welcome#pathway'
  match '/quiz/:id', to: 'welcome#quiz', as: :next_quiz
  get '/settings/:section', to: 'account_settings#edit', as: :edit_account_settings
  put '/settings/:id', to: 'account_settings#update', as: :update_account_settings
  
  resource :welcome
  
  # Routes for potential candidates
  namespace :candidate do
    resources :program_sessions do
      collection do
        post :date_list
      end
    end
    
    root to: 'base#index'
  end

  # Routes for Coleman Employees
  namespace :employee do
    resources :users
    resources :activations, only: [:create, :destroy]
    resources :candidates
    resources :program_dates, only: [:index, :show]
    resources :session_attendance, only: [:create, :destroy]
    
    root to: 'base#index'
  end
  
  devise_for :users
  
  root to: 'welcome#index'
  
end