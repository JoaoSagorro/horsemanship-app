class AlunoProfilesController < ApplicationController
  def index
    @alunos = AlunoProfiles.all
  end

  def edit
    @user = current_user
    @aluno = AlunoProfile.find_by(user_id: @user.id)
  end

  def updated
    @user = current_user
    @aluno = AlunoProfile.find_by(user_id: @user.id)
    if @aluno.update(aluno_params)
      redirect_to aulas_path
    else
      render :update, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @aluno = AlunoProfiles.find(params[:id])
  end

  def profile
    @user = current_user
  end

  private

  def aluno_params
    params.require(:aluno_profile).permit(
      :first_name,
      :last_name,
      :morada,
      :birthdate,
      :nif,
      :numero_utente,
      :cartao_cidadao,
      :validity,
      :contacto,
      :encarregado_educação,
      :grau_parentesco,
      :contacto_emergencia,
      :aulas,
      :horario_preferencial,
      :recolha_dados,
      :fotografias_captadas
    )
  end
end
