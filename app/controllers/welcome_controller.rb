class WelcomeController < ApplicationController
  def index
    user_signed_in?
    # User is signed in, display app guide
  end
end
