class FavoritesController < ApplicationController
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(micropost)
    flash[:success] = 'マイクロポストをお気に入りしました。'
    redirect_to root_path
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = 'マイクロポストのお気に入りを解除しました。'
    redirect_to root_path
  end
end
