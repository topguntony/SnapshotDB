class RiseAndShinesController < ApplicationController
  def show
    # we dont want heroku to fall asleep
    # ping every 3 seconds to keep process running
    render :text => "shake a leg"
  end
end
