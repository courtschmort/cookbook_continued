class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    if params[:asc]
      @recipes = Recipe.sort_by_asc
    elsif params[:desc]
      @recipes = Recipe.sort_by_desc
    end
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "#{@recipe.title} was successfully added!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def update
    @recipe = Recipe.find(params[:id])
    if (params[:commit] === "Add Tag")
      tag = Tag.find(params[:recipe][:id])
      tag.recipes << @recipe
      redirect_to recipe_path
    elsif @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "#{@recipe.title} was successfully deleted!"
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :rating, :ingredients, :instructions)
  end

end
