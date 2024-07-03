class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
    @flats = policy_scope(Flat)
  end

  def show
    @markers = [{
      lat: @flat.latitude,
      lng: @flat.longitude
    }]
    @bookings = Booking.where(flat_id: @flat_id)
    @price = @flat.price_per_night
    @dates_booking = @bookings.map { |booking| { from: booking.start_date, to: booking.end_date } }.to_json
    @booking = Booking.new
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @flat
  end

  def update
    authorize @flat
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    authorize @flat
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
