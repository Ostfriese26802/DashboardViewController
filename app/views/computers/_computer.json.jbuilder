json.extract! computer, :id, :fqdn, :url, :gruppe_id, :standort, :benutzer, :created_at, :updated_at
json.url computer_url(computer, format: :json)
