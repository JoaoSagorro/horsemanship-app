class AulasController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  helper_method :booked_class

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
    @aulas = Aula.all
  end

  def booked_class(class_id)
    @aula = Aula.find(class_id)
    @aula.booked? ? @aula.booked = false : @aula.booked = true
  end


  private

  def set_params
    params.require(:aula).permit(:title, :description, :class_type, :comments, :occurs_date, :start_time, :end_time, :booked)
  end
end
