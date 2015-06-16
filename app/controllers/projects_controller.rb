class ProjectsController < ApplicationController
  def index
    @projects = client.projects.sort_by(&:name)
  end

  def show
    @project = client.projects(params[:id])
    @people = client.people.sort_by(&:name)
    @project_people = Set.new(@project.accesses.map(&:id))
  end
end
