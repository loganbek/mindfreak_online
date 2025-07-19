class Web3SessionsController < ApplicationController
  protect_from_forgery except: :create

  def new
    # Renders the login/register page
  end

  def create
    # Verify signature and address from params
    address = params[:address]
    signature = params[:signature]
    message = params[:message]

    if Web3AuthService.valid_signature?(address, signature, message)
      user = User.find_or_create_by(wallet_address: address.downcase)
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in with MetaMask!'
    else
      flash[:alert] = 'Signature verification failed.'
      render :new, status: :unauthorized
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logged out.'
  end
end
