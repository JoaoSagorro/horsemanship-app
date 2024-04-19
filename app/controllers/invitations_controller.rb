class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters

  def create
    super do |resource|
      if resource.persisted? && resource.role == "aluno"
        AlunoProfile.create(
          set_params
        )
      end
    end
  end

  private

  def set_params
    params.require(:user).permit(
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

  protected

  # Permit the new params here.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :role])
  end
end
