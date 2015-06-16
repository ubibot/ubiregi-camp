class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :test_session_or_redirect_to_login

  private

  def client
    Logan::Client.new(BASECAMP_ID, { username: BASECAMP_USERNAME, password: BASECAMP_PASSWORD }, BASECAMP_USERAGENT)
  end

  def authenticated?
    session[:authenticated]
  end

  def test_session_or_redirect_to_login
    return if authenticated?
    redirect_to login_url(path: request.path)
  end
end
