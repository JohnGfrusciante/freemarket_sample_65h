class InformationsController < ApplicationController
  
  before_action :check_login

  def index
  end

  private
  def check_login
    if !current_user.presence
      redirect_to '/users/sign_in' and return
    end
  end
end