ColemanConnection::Application.routes.draw do
  
  match '/pathway', to: 'welcome#pathway'
  match '/quiz/:id', to: 'welcome#quiz', as: :next_quiz
  
  resource :welcome
  
  devise_for :users
  
  # Routes for students
  namespace :students do
    root to: 'base#index'
  end

  # Routes for staff
  namespace :staff do
    root to: 'base#index'
  end
  
  root to: 'welcome#index'
  
end
