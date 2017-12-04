class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :test_session_or_redirect_to_login

  private

  def client
    Logan::Client.new(BASECAMP_ID, { access_token: BASECAMP_TOKEN }, BASECAMP_USERAGENT)
  end

  def authenticated?
    session[:authenticated]
  end

  def test_session_or_redirect_to_login
    return if authenticated?
    redirect_to login_url(path: request.path)
  end

  def manageable_person?(person)
    return true unless BASECAMP_GROUP_ID

    unless @managing_people
      members = client.groups(BASECAMP_GROUP_ID).memberships
      @managing_people = Set.new(members.map(&:id))
    end

    id = case person
         when Logan::Person
           person.id
         else
           person
         end
    @managing_people.member?(id)
  end

  helper_method :manageable_person?
end
