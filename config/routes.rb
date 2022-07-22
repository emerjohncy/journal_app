Rails.application.routes.draw do
  devise_for :users
  get '/users', to: redirect('/users/sign_up')

  root "categories#index"

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

  put '/categories/:id' => 'categories#update'

  patch '/categories/:id' => 'categories#update'
    
  delete '/categories/:id' => 'categories#destroy'


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
  
  put '/categories/:category_id/tasks/:id' => 'tasks#update'

  patch '/categories/:category_id/tasks/:id' => 'tasks#update'

  delete '/categories/:category_id/tasks/:id' => 'tasks#destroy'

  get '/today' => 'tasks#today'

  get '/overdue' => 'tasks#overdue'

  # ERRORS
  get '*path' => redirect('/')
end
