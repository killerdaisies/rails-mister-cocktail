class DosesController < ApplicationController
  before_action :set_dose, only: [:show]
  before_action :set_cocktail, only: [:new, :show]

  def new
    @dose = Dose.new
  end

  def show
  end

  def create
    @dose = Dose.new(permits)
    @dose.cocktail_id = params[:cocktail_id]
    if @dose.save
      redirect_to cocktail_path(params[:cocktail_id])
    else
      render :new
    end
  end

  def destroy
    dose = Dose.find(params[:id]).destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end


  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def permits
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
