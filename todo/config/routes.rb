Todo::Application.routes.draw do
  root to: 'welcome#index'
  resources :users
  resources :lists
  resources :user_sessions, only: [ :new, :create, :destroy ]

	get 'login'  => 'user_sessions#new'
	get 'logout' => 'user_sessions#destroy'
end
