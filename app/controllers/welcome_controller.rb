class WelcomeController < ApplicationController
  def index
    @projects = client.projects.sort_by(&:created_at).reverse.take(15)
    @people = client.people.sort_by(&:created_at).reverse.take(10)
  end

  def login

  end

  def logout
    reset_session
    redirect_to root_url, turbolinks: false
  end
end
