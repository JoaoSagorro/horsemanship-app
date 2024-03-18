class AulasController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def index
    @aulas = Aula.all
  end

  def show
    @aula = Aula.find(params[:id])
  end
end
