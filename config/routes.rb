Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :user,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  namespace :public do
    post 'comments/create/:id' => "comments#create", as: "comments_create"
    delete 'comments/destroy/:id' => "comments#destroy", as: "comments_destroy"

    post 'favorites/create/:id' => "favorites#create", as: "favorites_create"
    delete 'favorites/destroy/:id' => "favorites#destroy", as: "favorites_destroy"

    get 'statuses/index'

    get 'post_routines/index' => "post_routines#index", as: "post_routines_index"
    delete 'post_routines/destroy/:id' => "post_routines#destroy", as: "post_routines_destroy"
    post 'post_routines/create' => "post_routines#create", as: "post_routines_create"
    patch 'post_routines/update/:id' => "post_routines#update", as: "post_routines_update"
    get 'post_routines/show/:id' => "post_routines#show", as: "post_routines_show"
    get 'post_routines/edit/:id' => "post_routines#edit", as: "post_routines_edit"
    post 'post_routines/count_up/:id' => 'post_routines#count_up', as: "post_routines_count_up"
    post 'post_routines/count0/:id' => 'post_routines#count0', as: "post_routines_count0"
    get 'post_routines/study' => "post_routines#study", as: "post_routines_study"
    get 'post_routines/exercise' => "post_routines#exercise", as: "post_routines_exercise"
    get 'post_routines/others' => "post_routines#others", as: "post_routines_others"



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

    resources :comments, only: [:index, :show]
    delete 'comments/destroy/:id' => "comments#destroy", as: "comments_destroy"

    resources :users, only: [:index, :show]
    get 'users/edit/:id' => "users#edit", as: "user_edit"
    patch 'users/update/:id' => "users#update", as: "user_update"

  end

#ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

end
