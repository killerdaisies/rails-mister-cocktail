class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_permits)
    if @cocktail.save
      @dose = Dose.new(dose_permits)
      @dose.cocktail_id = @cocktail.id
      if @dose.save
        redirect_to cocktails_path
      else
        render :new
      end
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(permits)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def permits
    params.require(:cocktail).permit(:name, :description, :doses, :photo, :photo_cache)
  end

  def cocktail_permits
    params.require(:cocktail).permit(:name, :doses, :description, :photo, :photo_cache)
  end

  def dose_permits
    params.require(:cocktail).require(:doses).permit(:description, :ingredient_id)
  end
end
