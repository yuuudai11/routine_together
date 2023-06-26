Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  namespace :public do
    get 'comments/create'
    get 'comments/destroy'

    get 'favorites/create'
    get 'favorites/destroy'

    get 'statuses/index'

    get 'post_routines/index'
    get 'post_routines/destroy'
    post 'post_routines/create' => "post_routine#create", as: "post_routine_create"
    get 'post_routines/update'
    get 'post_routines/show'
    get 'post_routines/edit'

    get 'users/index'
    get 'users/show/:id' => "users#show", as: "users_show"
    get 'users/edit'
    get 'users/update'
    get 'users/withdrawal'
    get 'users/withdraw'

  end
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get '/' => 'homes#top'

    get 'comments/index'
    get 'comments/show'
    get 'comments/destroy'

    get 'statuses/index'
    get 'statuses/edit'
    get 'statuses/update'
    get 'statuses/create'

    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
