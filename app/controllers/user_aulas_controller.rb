class UserAulasController < ApplicationController
  def clientes
    @clients = User.all
  end
end
