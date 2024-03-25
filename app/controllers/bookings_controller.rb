class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(set_params)
    @aula = Aula.find(params[:id])
    raise
    @booking.aula_id = @aula.id
    @booking.user_id = current_user.id
    if @booking.save
      @booking.update(status: !@booking.status)
      redirect_to aulas_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:booking).permit(:attendees, :status)
  end
end
