class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @bookings = policy_scope(Booking.where(user_id: current_user.id).order(created_at: :desc))
    end
  end


  def show
    authorize @booking
  end

  def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
    authorize @booking
    authorize @boat
  end

  def edit
    authorize @booking
  end

  def create
    sleep 1.5
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new(booking_params)
    @booking.boat = @boat
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
    authorize @booking

    if @booking.update(booking_params)
      redirect_to bookings_path
    else
      render :update
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :validated)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
