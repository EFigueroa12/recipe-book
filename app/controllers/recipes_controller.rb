class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[ create ]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new, status: :unprocessable_identity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      puts @recipe.errors.full_messages
      render :edit, status: :unprocessable_identity
    end
  end

  def destroy
    if @recipe.user == current_user
      @recipe.destroy
      redirect_to recipes_path
    else
      redirect_to recipes_path, alert: "Not authorized"
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :prep_time, :cook_time, :servings, :difficulty, :cuisine_type, :category, :instructions)
    end
end
