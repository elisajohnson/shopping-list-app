class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # this determines what inputs are allowed in the new user fields
    user = User.new(params.require(:user).permit(:username, :email, :password))
    if user.save
      # redirect to the new session if the user is successfully created
      redirect_to new_session_path(user_created: 'true')
    end
  end

  def show
    @user = User.find(session['user_id'])
  end

  def edit
  end
end
