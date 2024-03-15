class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :school]

  def home
  end

  def about
  end

  def school
  end
end
