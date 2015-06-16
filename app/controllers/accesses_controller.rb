class AccessesController < ApplicationController
  TYPES = StrongJSON.new do
    let :access, object(person_id: numeric, project_id: numeric)
  end

  def grant
    json = posted_json
    client.projects(json[:project_id].to_i).add_user_by_id(json[:person_id].to_i)
    head :ok
  end

  def reject
    json = posted_json
    client.projects(json[:project_id].to_i).remove_user_by_id(json[:person_id].to_i)
    head :ok
  end

  private

  def posted_json
    TYPES.access.coerce(JSON.parse(request.raw_post, symbolize_names: true))
  end
end
