class User::RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = "レシピを投稿しました"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @recipes = Recipe.page(params[:page]).per(10)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @tags = @recipe.tag_counts_on(:tags)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "レシピを更新しました"
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "レシピの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "レシピを削除しました"
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:dish_name,:recipe,:image,:tag_list)
  end

end
