class BookingsController < ApplicationController
  before_action :set_flat, only: [:show, :new, :create, :destroy, :accept, :reject]
  before_action :set_user, only: [:show, :new, :create, :accept, :reject]

  def show
    @booking = Booking.find(params[:id])
  end
  def new
    @bookings = Booking.where(flat_id: @flat_id)
    @price = @flat.price_per_night
    @dates_booking = @bookings.map { |booking| { from: booking.start_date, to: booking.end_date } }.to_json
    @booking = Booking.new
  end

  def create
    if current_user
      @booking = Booking.new(booking_params)
      @booking.user_id = @user.id
      @booking.flat_id = @flat.id
      if @booking.save!
        total_price = @flat.price_per_night * (@booking.end_date - @booking.start_date).to_i
        @booking.update!(total_price: total_price)
        redirect_to flat_booking_path(@flat.id, @booking)
      else
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.flat_id = @flat.id
    @booking.destroy
    redirect_to user_path(current_user.id), status: :see_other
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: 'approved')
    redirect_to user_path(@user), notice: "Booking successfully accepted!"
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: 'rejected')
    redirect_to user_path(@user), notice: "Booking rejected!"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_user
    @user = current_user
  end

end
