class SessionsController < ApplicationController

  def new
    # we don't need to instantiate a
    # user object in our new action b/c we are only
    # loggin in, not creating a new user
  end

  def create
    user = User.find_by(email: params[:email])
    # this will find the user based on
    # the email they  input and assign it to
    # the variable user
    if user && user.authenticate(params[:password])
    # this is checking if the user
    # (based on the email input) exists and
    # then check if they are authenticated
    # with the password - which the password
    # is hashed and salted into the password_digest
    # and the digests are compared
      session[:user_id] = user.id
    # if this all matches (evaluates to 'true') then
    # we create a key-value pair in the session
    # hash 'user_id' is the key
    # and the user's id is the value (ie the session key)
      redirect_to products_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email or passsword"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_path, notice: "Logged out!"
  end

end
