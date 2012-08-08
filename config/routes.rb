ColemanConnection::Application.routes.draw do
  
  match '/pathway', to: 'welcome#pathway'
  match '/quiz/:id', to: 'welcome#quiz', as: :next_quiz
  get '/settings/:section', to: 'account_settings#edit', as: :edit_account_settings
  put '/settings/:id', to: 'account_settings#update', as: :update_account_settings
  
  resource :welcome
  
  devise_for :users
  
  # Routes for students
  namespace :students do
    root to: 'base#index'
    resources :program_sessions do
      collection do
        post :date_list
      end
    end
  end

  # Routes for Coleman Employees
  namespace :employee do
    root to: 'base#index'
  end
  
  root to: 'welcome#index'
  
end
