class WelcomeController < ApplicationController
  skip_before_action :test_session_or_redirect_to_login

  def index
    if authenticated?
      @projects = client.projects.sort_by(&:created_at).reverse.take(15)
      @people = client.people.sort_by(&:created_at).reverse.take(10)
    else
      render :welcome, layout: false
    end
  end

  def login
    redirect_to "/auth/google?path=#{CGI.escape(params[:path] || root_url)}", turbolinks: false
  end

  def logout
    reset_session
    redirect_to root_url, turbolinks: false
  end

  def oauth2callback
    session[:authenticated] = true
    redirect_to request.env['omniauth.params']["path"] || root_url
  end
end
