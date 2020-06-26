class SessionsController < ApplicationController
  def new
  end

# それは送信するもの
  def create
    # params にフォームデータは代入されていて入力したものを小文字にして取得する。
    email = params[:session][:email].downcase
    # パスワードを取得する
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end
    
# 消去する
  def destroy
    # セッションをnilにする
    session[:user_id] = nil
    # フラッシュメッセージ
    flash[:success] = 'ログアウトしました。'
    # トップページにリダイレクト
    redirect_to root_url
  end
  
  private

  def login(email, password)
    # メアドを取得して検索する
    @user = User.find_by(email: email)
    # メアドとパスの組み合わせが一致したら1を返す
    if @user && @user.authenticate(password)
      # ログイン成功
      # ブラウザには Cookie として、サーバには Session として、ログイン状態が維持される
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
