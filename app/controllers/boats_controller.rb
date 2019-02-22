class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # def index
  #   @boats = policy_scope(Boat)
  # end
  # def search
  #   if params[:search][:category].empty?
  #     redirect_to boats_path
  #   else
  #     @boats = Boat.where(category: params[:search][:category])
  #   end
  # end

  def index
    @category = params[:query]
    @address = params[:address]
    raise
    if @address.present? && @category.present?
      @boats = policy_scope(Boat)
      @boats = Boat.where(address: @address).where(category: @category).where.not(latitude: nil, longitude: nil)
    elsif @address.present?
      @boats = policy_scope(Boat)
      @boats = Boat.where(address: @address).where.not(latitude: nil, longitude: nil)
    elsif @category.present?
      @boats = policy_scope(Boat)
      @boats = Boat.where(category: @category).where.not(latitude: nil, longitude: nil)
    else
      @boats = policy_scope(Boat)
      @boats = Boat.where.not(latitude: nil, longitude: nil)

    end
    authorize @boats
    @markers = @boats.map do |boat|
      {
        lng: boat.longitude,
        lat: boat.latitude
      }
    end
  end

  def show
    authorize @boat
    @boats = Boat.where(id: params[:id])
    @markers = @boats.map do |boat|
      {
        lng: boat.longitude,
        lat: boat.latitude
      }
    end
  end

  def new
    @boat = Boat.new
    authorize @boat
  end

  def edit
  end

  def filter
    @boats = Boat.where(category: "RIB")
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
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

    params.require(:boat).permit(:price_per_day, :category, :description, :name, :cabin, :capacity, :length, :address, :photo, :photo_2, :photo_3)
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end
end
