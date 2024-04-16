class AlunoProfilesController < ApplicationController
  def index
    @alunos = AlunoProfile.all
  end
end
