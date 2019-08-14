class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build name: "Sugar"
    @recipe.ingredients.build name: "Flower"
  end

  def create
    #raise params.inspect
    @recipe = Recipe.create(recipe_params)

    redirect_to @recipe
  end

  private 

  def recipe_params
    params.require(:recipe).permit(:title,  ingredients_attributes: [
      :name,  :quantity]
      ])
  end
  
end
