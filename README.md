# Ubiregi Camp

Basecamp Console for loosely managed projects and members.

## Setup

Define the following environment variables for Basecamp configuration:

* BASECAMP_ID - Basecamp account ID `1234567`
* BASECAMP_USERNAME - Basecamp username
* BASECAMP_PASSWORD - Basecamp password
* BASECAMP_USERAGENT - Useragent sent to Basecamp `Ubiregi Camp (soutaro@ubiregi.com)`
* (Optional) BASECAMP_GROUP_ID - Basecamp group id; the basecamp account can be managed through this app if the account belongs to the group

Define the following environment variables for authentication configuration:

* OMNIAUTH_GOOGLE_CLIENT_ID
* OMNIAUTH_GOOGLE_CLIENT_SECRET
* OMNIAUTH_VALID_DOMAIN - Domain name to accept login `ubiregi.com`

Define the following environment variable to use SSL.

* FORCE_SSL - `true` to enable `force_ssl` in production
