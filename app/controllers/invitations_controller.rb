class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  def create
    super do |resource|
      if resource.persisted? && resource.role == "aluno"
        AlunoProfile.create(
          params.require(:user).permit(
            :user,
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
        )
      end
    end
  end

  private

  def set_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :role])
  end
end
