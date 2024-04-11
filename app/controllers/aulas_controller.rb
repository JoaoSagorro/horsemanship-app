class AulasController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @aulas = Aula.all
  end

  def show
    @user = current_user
    @aula = Aula.find(params[:id])
  end

  def new
    @aula = Aula.new
  end

  def create
    @aula = Aula.new(set_params)
    @aula.creator = "#{current_user.first_name} #{current_user.last_name}"
    @teacher = User.where(role: :professor).map { |id| id}
    if @aula.save
      @aula.user_ids = params[:aula][:user_ids] || []
      redirect_to aulas_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @aula = Aula.find(params[:id])
  end

  def update
    @aula = Aula.find(params[:id])
    if @aula.update(set_params)
      @aula.user_ids = params[:aula][:user_ids] || []
      redirect_to aulas_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @aula = Aula.find(params[:id])

    @aula.destroy

    redirect_to aulas_path
  end

  def today
    @user = current_user
    @aulas = Aula.where(occurs_date: Date.today)
    @bookings = Booking.where(aula_id: @aulas.pluck(:id), user_id: @user.id)
  end

  def booked_class
    @aula = Aula.find(params[:id])
    @aula.update(booked: !@aula.booked)
  end

  def all_month
    @month = (Date.today.at_beggining_of_month..Date.today.at_end_of_month)
  end


  private

  def set_params
    params.require(:aula).permit(
      :title,
      :description,
      :class_type,
      :comments,
      :occurs_date,
      :start_time,
      :end_time,
      :spots,
      :teacher
    )
  end
end
