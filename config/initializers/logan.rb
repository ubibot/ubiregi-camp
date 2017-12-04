BASECAMP_ID = ENV["BASECAMP_ID"]
BASECAMP_TOKEN = ENV["BASECAMP_TOKEN"]
BASECAMP_USERAGENT = ENV["BASECAMP_USERAGENT"] || "Ubiregi Camp (dev@ubiregi.com)"
BASECAMP_GROUP_ID = ENV["BASECAMP_GROUP_ID"]

class Logan::Project
  attr_accessor :created_at

  def remove_user_by_id(id)
    params = {
      :headers => Logan::Client.headers.merge({'Content-Type' => 'application/json'})
    }

    Logan::Client.delete "/projects/#{@id}/accesses/#{id}.json", params
  end
end

