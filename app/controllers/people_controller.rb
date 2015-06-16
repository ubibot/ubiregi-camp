class PeopleController < ApplicationController
  def index
    @people = client.people.sort_by(&:name)
  end

  def show
    @person = client.person(params[:id])
    pp @person.attributes
    @projects = client.projects.sort_by(&:name)
    @person_projects = Set.new(@person.projects.map(&:id))
  end
end
