BASECAMP_ID = ENV["BASECAMP_ID"]
BASECAMP_USERNAME = ENV["BASECAMP_USERNAME"]
BASECAMP_PASSWORD = ENV["BASECAMP_PASSWORD"]
BASECAMP_USERAGENT = "Ubiregi Camp (dev@ubiregi.com)"

class Logan::Project
  def remove_user_by_id(id)
    params = {
      :headers => Logan::Client.headers.merge({'Content-Type' => 'application/json'})
    }

    Logan::Client.delete "/projects/#{@id}/accesses/#{id}.json", params
  end
end
