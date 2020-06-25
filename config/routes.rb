Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # Microposts は独立したトップページを作成します
    root to: 'toppages#index'
    # 既に resources で users#new は設定されているのに、 get 'signup', to: 'users#new' をわざわざルーティングに追加したのは、ユーザの新規登録 URL を /signup にしたかったから
    get 'signup_path', to: 'users#new'
    # 必要なアクションだけ only: ... として指定
    resources :users, only: [:index, :show, :new, :create]
end
