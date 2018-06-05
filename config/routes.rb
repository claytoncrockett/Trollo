Rails.application.routes.draw do
  root 'boards#index'
  resources :boards do
    resources :lists
    put 'lists/:id/up', to: "lists#up", as: 'list_up'
    put 'lists/:id/down', to: "lists#down", as: 'list_down'
  end

  scope 'lists/:list_id', as: 'list' do
    resources :tasks
    put 'tasks/:id/up', to: "tasks#up", as: 'task_up'
    put 'tasks/:id/down', to: "tasks#down", as: 'task_down'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
