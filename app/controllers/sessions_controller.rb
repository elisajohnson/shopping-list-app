class SessionsController < ApplicationController
  def new
    # user can input their info
    @user = User.new
  end

  def create
    # user can create their profile and have it save and authenticate
    u = User.where(email: params[:user][:email]).first
    if u != nil && u.authenticate(params[:user][:password])
      session['user_id'] = u.id.to_s
      redirect_to groceries_path(session[''])
    else
      # if it doesn't authenticate it will be redirected to the new session again
      redirect_to new_session_path
    end
  end

  def destroy
    # log out
    session.destroy
    redirect_to new_session_path
  end
end
