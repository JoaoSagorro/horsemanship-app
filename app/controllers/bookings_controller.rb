class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  # def new
  #   @aula = Aula.find(params[:aula_id])
  #   @booking = Booking.new(aula_id: @aula.id)
  # end
  def create
    @aula = Aula.find(params[:aula_id])
    booking = current_user.bookings.find_by(aula_id: @aula.id)

    if booking.nil?
    # Create a new booking
      # @booking = Booking.new(aula_id: @aula.id, user_id: current_user.id, status: true)
      # @booking.increment!(:attendees)
      @booking = Booking.new(set_params)
      @booking.user_id = current_user.id
      @booking.aula_id = @aula.id
      @booking.attendees = 1
      @booking.status = true
    else
      # Cancel existing booking
      @booking = booking
      @booking.attendees -= 1 unless @booking.attendees.zero?
      @booking.status = false
    end

    if @booking.save && @aula.save
      redirect_to aulas_path, notice: 'Booking was successfully created/canceled.'
    else
      redirect_to aulas_path, notice: "The booking did nothing"
    end
    # @booking = Booking.new(set_params)
    # @booking.aula_id = @aula.id
    # @booking.user_id = current_user.id
    # @booking.attendees += 1
    # if @booking.save
    #   @booking.update(status: !@booking.status)
    #   redirect_to aulas_path
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def update
    
  end

  private

  def set_params
    params.require(:booking).permit(:attendees, :status)
  end
end
