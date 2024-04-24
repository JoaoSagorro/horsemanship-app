class UserAulasController < ApplicationController
  def clientes
    @clients = User.all.includes(:aluno_profile) # eager load associated AlunoProfile
    @aulas = Aula.all
  end
end
