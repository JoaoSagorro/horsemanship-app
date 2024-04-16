class Users::InvitationsController < Devise::InvitationsController

  def create
    super do |resource|
      if resource.persisted? && resource.role == "aluno"
        AlunoProfile.create(
          user: resource,
          morada: params[:user][:morada],
          birthdate: params[:user][:birthdate],
          nif: params[:user][:nif],
          numero_utente: params[:user][:numero_utente],
          cartao_cidadao: params[:user][:cartao_cidadao],
          validity: params[:user][:validity],
          contacto: params[:user][:contacto],
          encarregado_educação: params[:user][:encarregado_educação],
          grau_parentesco: params[:user][:grau_parentesco],
          contacto_emergencia: params[:user][:contacto_emergencia],
          aulas: params[:user][:aulas],
          horario_preferencial: params[:user][:horario_preferencial],
          recolha_dados: params[:user][:recolha_dados],
          fotografias_captadas: params[:user][:fotografias_captadas]
        )
      end
    end
  end

  private

  def set_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end
end
