Todo::Application.routes.draw do
  root to: 'welcome#index'
  resources :users
  resources :lists
end
