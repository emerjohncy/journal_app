Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Categories Routes
  get '/categories' => 'categories#index', 
    as: 'categories'
    
  get '/categories/new' => 'categories#new',
    as: 'new_category'

  get '/categories/:id' => 'categories#show',
    as: 'category'

  post '/categories' => 'categories#create',
    as: 'create_category'

  get '/categories/:id/edit' => 'categories#edit',
    as: 'edit_category'

  patch '/categories/:id' => 'categories#update',
    as: 'update_category'
    
  delete '/categories/:id' => 'categories#destroy',
    as: 'delete_category'


  # Tasks Routes
  get '/categories/:category_id/tasks' => 'tasks#index',
    as: 'category_tasks'
  
  get '/categories/:category_id/tasks/new' => 'tasks#new',
    as: 'new_category_task'

  post 'categories/:category_id/tasks' => 'tasks#create',
    as: 'create_category_task'

  get '/categories/:category_id/tasks/:id' => 'tasks#show',
    as: 'category_task'

  get '/categories/:category_id/tasks/:id/edit' => 'tasks#edit',
    as: 'edit_category_task'
  
  patch '/categories/:category_id/tasks/:id' => 'tasks#update',
    as: 'update_category_task'
end
