# ApplicationController にメソッドを定義すると、全ての Controller で定義したメソッドが使用できるようになります。
class ApplicationController < ActionController::Base
  # ここで Helper に定義していた logged_in? を使用していますが、実は Controller から Helper のメソッドを使うことはデフォルトではできません
    include SessionsHelper
     private
# ログイン要求処理.
# ログインしていれば何もせず、ログインしていなければログインページへ強制的にリダイレクト
  def require_user_logged_in
    #   もしログインしていなかったら
    unless logged_in?
        # ログイン画面へいく
      redirect_to login_url
    end
  end
end
