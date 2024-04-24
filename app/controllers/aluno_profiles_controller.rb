class AlunoProfilesController < ApplicationController
  def index
    @alunos = AlunoProfile.all
  end

  def show
    @user = current_user
    @aluno = AlunoProfile.find(params[:id])
  end

  def profile
    @user = current_user
    @aluno = AlunoProfile.find(params[:id])
  end
end
