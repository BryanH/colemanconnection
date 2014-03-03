ColemanConnection::Application.routes.draw do
  
  # mount Flair::Engine => "/flair" if Rails.env.development?
  mount EmailPreviewers::Devise::Preview => 'devise_preview' if Rails.env.development?
  mount Announcements::Preview => 'announcement_emails' if Rails.env.development?
  mount Notifications::Preview => 'notification_emails' if Rails.env.development?
  
  match '/pathway', to: 'welcome#pathway'
  match '/quiz/:id', to: 'welcome#quiz', as: :next_quiz
  get '/settings/:section', to: 'account_settings#edit', as: :edit_account_settings
  put '/settings/:id', to: 'account_settings#update', as: :update_account_settings
  
  devise_scope :user do
    match '/get_started' => 'devise/registrations#index', as: :get_started
  end
  
  resource :welcome
  resources :survey_results
  
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
    resources :reports, only: :show
    resources :program_dates
    resources :program_sessions do
      get 'happiness', on: :member
    end
    resources :session_attendance, only: [:create, :destroy]
    resources :program_attendance, only: [:create, :destroy]
    resources :permissions, only: [:show, :update]
    resources :programs
    resources :discipline_teams
    resources :program_activations, only: [:create, :destroy]
    resources :pathway_settings
    
    root to: 'base#index'
  end
  
  devise_for :users
  
  root to: 'welcome#index'
  
end
