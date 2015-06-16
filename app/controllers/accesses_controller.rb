class AccessesController < ApplicationController
  before_action :ensure_person_is_manageable

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

  def ensure_person_is_manageable
    person_id = posted_json[:person_id]
    unless manageable_person?(person_id)
      render json: ["The person is not under the control of this app"], status: 400
    end
  end
end
