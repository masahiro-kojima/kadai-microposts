class UsersController < ApplicationController
  def index
    # idを基準に25降順に一覧表示する。ページネーションをつける
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    # idを受け取りデータベースから引っ張る
    @user = User.find(params[:id])
  end

  def new
    # ユーザー登録をする
    @user = User.new
  end

　def create
　 # フォームから送信した情報からオブジェクトを作成する。
    @user = User.new(user_params)
# もし保存できたら
    if @user.save
      # フラッシュメッセージを表示する
      flash[:success] = 'ユーザを登録しました。'
      # showビュへといく。
      # redirect_to user_url(@user)と同じ。ルートを見るとusers#showとなっている。
      redirect_to @user
    else
      # 保存に失敗したら失敗メッセージを表示
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      # またnewビューへといく。
      render :new
    end
  　end

  private
  def user_params
    # 取得できるパラメータを制限するんだっけ？
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
