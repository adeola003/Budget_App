class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      # User is signed in, display app guide
    else
      # User is not signed in, display registration and login buttons
    end
  end
end
