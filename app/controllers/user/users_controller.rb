class User::UsersController < ApplicationController
  # users/concernに定義
  include Users

  # users/concernに定義
  def index
    get_users
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
    @favorite_recipes = Recipe.where(user: @user, favorite: true)
    favorites = Favorite.where(user_id: @user.id).pluck(:recipe_id)
    # いいねした投稿一覧
    @like_recipes = Recipe.where(id: favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "情報の更新に失敗しました"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
