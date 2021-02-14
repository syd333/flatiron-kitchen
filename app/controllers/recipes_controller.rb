class RecipesController < ApplicationController
    before_action :find_recipe, only: [:edit, :update]

    def index
        @recipes = Recipe.all
        @ingredients = Ingredient.all
    end

    def show
    end

    def new 
        @recipe = Recipe.new
    end

    def create 
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else 
            render :new
        end
    end

    def edit

    end

    def update 
        if @recipe.update(recipe_params)
            @recipe.save
            redirect_to recipes_path
        else
            render :edit
        end
    end
    private
    def recipe_params
        params.require(:recipe).permit(:name, ingredient_ids: [])
    end

    def find_recipe
        @recipe = Recipe.find(params[:id])
    end

end
