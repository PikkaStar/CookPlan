module User::UsersHelper
  
  def recipe_user?(user)
     @recipe.user == current_user
  end
  
end
