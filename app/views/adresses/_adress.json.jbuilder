json.extract! adress, :id, :street, :city, :state, :contact, :created_at, :updated_at
json.url adress_url(adress, format: :json)
