class User::RecipesController < ApplicationController

 def new
   @recipe = Recipe.new
 end

 def create
  @recipe = Recipe.new(recipe_params)
  @recipe.user_id = current_user.id
  if @recipe.save
    flash[:notice] = "レシピを登録しました"
    redirect_to recipe_path(@recipe)
  else
    flash[:alert] = "レシピの登録に失敗しました"
    render :new
  end
 end

 def index
  @recipes = Recipe.all
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

 private

 def recipe_params
  params.require(:recipe).permit(:title, ingredients_attributes: [:id, :name, :quantity, :_destroy])
 end

end
