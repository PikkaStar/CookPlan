class User::RecipesController < ApplicationController
 before_action :authenticate_user!,only: [:create,:edit,:new,:update,:destroy]

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
    flash.now[:alert] = "レシピの登録に失敗しました"
    render :new
  end
 end

 def index
  @recipes = Recipe.page(params[:page]).per(5)
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

 def show
  @recipe = Recipe.find(params[:id])
 end

 def destroy
  @recipe = Recipe.find(params[:id])
  @recipe.destroy
  flash[:notice] = "レシピを削除しました"
  redirect_to recipes_path
 end

 # その日ごとのレシピを取得
 def daily_recipes
   @date = Date.parse(params[:date])
   @recipes = daily_recipes_for_date(@date)
 end

 def searches
  @range = params[:range]
  @word = params[:word]

  if @range == "料理名"
   @recipes = Recipe.looks(params[:word])
  elsif @range == "材料"
   @ingredients = Ingredient.looks(params[:word])
  else
   @recipes = Recipe.all
  end
 end

 private

 def recipe_params
  # 子要素のカラムの許可
  params.require(:recipe).permit(:title,:introduction,:image,:favorite, ingredients_attributes: [:id, :name, :quantity, :_destroy],steps_attributes: [:id,:text,:cook_image,:_destroy])
 end

 def daily_recipes_for_date(date)
   Recipe.where(created_at: date.beginning_of_day..date.end_of_day)
 end

end
