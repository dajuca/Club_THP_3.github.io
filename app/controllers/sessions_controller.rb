class SessionsController < ApplicationController
  def new
  end

  def create
    # create a new session
    # first get the user
    user = User.find_by(email: params[:session][:email].downcase)
    # if user isn't nil and if the password is correct
    if user && user.authenticate(params[:session][:password])
      # log_in (go to sessions_helper)
      log_in(user)
      redirect_to "/club", flash: {success: 'Vous êtes connecté !'}
    else
      redirect_to "/login", flash: { danger: 'Votre mail ou mdp sont incorrects, saisisez-les à nouveau'}
    end
  end

  def destroy
    log_out
    redirect_to root_url, flash: { success: "Au revoir !" }
  end
end
