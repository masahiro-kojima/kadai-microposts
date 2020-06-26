module SessionsHelper
    # 現在ログインしているユーザを取得する
 def current_user
      # 既に現在のログインユーザが代入されていたら何もせず、代入されていなかったら User.find(...) からログインユーザを取得し、@current_user に代入
       #今回のログインでは User.find_by(id: id) を使用して見つからない場合には単に nil を返すだけのほうが都合が良い
    @current_user ||= User.find_by(id: session[:user_id])
 end
  
# def logged_in? は、ユーザがログインしていれば true を返し、ログインしていなければ false を返します
 def logged_in?
    #  先ほど定義した current_user を使って、ユーザが現在ログインしているかを調べます。
    # ログインしていれば trueを返す
    # ログインしていなければ current_user は nil を返します
    !!current_user
 end
end
