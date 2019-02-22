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
    @boats = policy_scope(Boat)
    @boats = Boat.all
    @search = params[:query]
    if @search.present?
      @boats = Boat.where(category: @search)
                   .where("price_per_day <= ?", params[:max_price].to_i)
                   .where(address: params[:address])
    else
      @boats = policy_scope(Boat)
      @boats = Boat.all
    end
    authorize @boats
    @boats = Boat.where.not(latitude: nil, longitude: nil)
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
    params.require(:boat).permit(:price_per_day, :category, :description, :name, :cabin, :capacity, :length, :address,  :photo, other_photos: [])
  end

  def set_boat
    @boat = Boat.find(params[:id])
  end

end
