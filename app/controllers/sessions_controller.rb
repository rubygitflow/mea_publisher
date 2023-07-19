# frozen_string_literal: true

class SessionsController < ApplicationController
  # GET /session/new
  def new; end

  # POST /session or /session.json
  def create
    user = Person.find_by(email: user_params[:email])
    user = Person.find_by(nickname: user_params[:email]) unless user.present?
    user = user&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path, notice: 'You are logged in to the account.'
    else
      flash.now[:alert] = 'Incorrect password or nickname or email'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path, notice: 'You are logged out from the account.'
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:session)
  end
end
