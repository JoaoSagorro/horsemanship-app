class UserAulasController < ApplicationController
  def clientes
    @clients = User.all
    @alunos = AlunoProfile.all
  end
end
