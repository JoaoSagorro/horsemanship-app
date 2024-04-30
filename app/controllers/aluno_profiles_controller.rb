class AlunoProfilesController < ApplicationController
  def index
    @alunos = AlunoProfiles.all
  end

  def edit
    @user = current_user
    @aluno = AlunoProfile.find(params[user_id: @user.id])
  end

  def show
    @user = current_user
    @aluno = AlunoProfiles.find(params[:id])
  end

  def profile
    @user = current_user
  end
end
