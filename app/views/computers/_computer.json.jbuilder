json.extract! computer, :id, :fqdn, :url, :gruppe_id, :standort, :created_at, :updated_at
json.url computer_url(computer, format: :json)
