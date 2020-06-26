Rails.application.routes.draw do
  # ログイン画面を取得する
  get 'login', to: 'sessions#new'
  # 書いたものを送る
  post 'login', to: 'sessions#create'
  # 消去する
  delete 'logout', to: 'sessions#destroy'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Microposts は独立したトップページを作成します
  root to: 'toppages#index'
  # 既に resources で users#new は設定されているのに、 get 'signup', to: 'users#new' をわざわざルーティングに追加したのは、ユーザの新規登録 URL を /signup にしたかったから
  # 必要なアクションだけ only: ... として指定
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end
