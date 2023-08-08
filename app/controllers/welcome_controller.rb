class WelcomeController < ApplicationController
  def index
    return unless user_signed_in?
    # User is signed in, display app guide
  end
end
