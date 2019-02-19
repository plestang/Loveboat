class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = policy_scope(Boat)
  end

  def show
    authorize @boat
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def edit
  end

  def create
    @boat = Boat.new(boat_params)
    authorize @boat
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
  end

  def update
    authorize @boat
    @boat.update(boat_params)
  end

  def destroy
    authorize @boat
    @boat.destroy
    redirect_to boats_path
  end

  private

  def boat_params
    params.require(:boat).permit(:price_per_day, :category, :description, :photo)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end

end
