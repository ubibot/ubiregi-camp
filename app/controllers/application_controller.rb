class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def client
    Logan::Client.new(BASECAMP_ID, { username: BASECAMP_USERNAME, password: BASECAMP_PASSWORD }, BASECAMP_USERAGENT)
  end
end
