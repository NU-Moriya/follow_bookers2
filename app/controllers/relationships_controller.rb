class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.build(follower_id: params[:user_id]) #親モデル.子モデル.build
    follow.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id]) #ログインユーザーのフォローするリストのフォロワーidを特定して変数に入れる
    follow.destroy
    redirect_back(fallback_location: root_path)
  end
end
