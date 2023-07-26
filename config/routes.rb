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
    post 'comments/create/:id' => "comments#create", as: "comments_create"
    get 'comments/destroy/:id' => "comments#destroy", as: "comments_destroy"

    get 'favorites/create'
    get 'favorites/destroy'

    get 'statuses/index'

    get 'post_routines/index' => "post_routines#index", as: "post_routines_index"
    delete 'post_routines/destroy/:id' => "post_routines#destroy", as: "post_routines_destroy"
    post 'post_routines/create' => "post_routines#create", as: "post_routines_create"
    patch 'post_routines/update/:id' => "post_routines#update", as: "post_routines_update"
    get 'post_routines/show/:id' => "post_routines#show", as: "post_routines_show"
    get 'post_routines/edit/:id' => "post_routines#edit", as: "post_routines_edit"

    get 'users/index'
    get 'users/show/:id' => "users#show", as: "users_show"
    get 'users/edit/:id' => "users#edit", as: "users_edit"
    patch 'users/update/:id' => "users#update", as: "users_update"
    get 'users/withdrawal' => "users#withdrawal"
    patch 'users/withdraw' => "users#withdraw"

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
