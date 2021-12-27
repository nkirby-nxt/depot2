json.extract! customer, :id, :name, :street, :state, :zip, :phone, :email, :created_at, :updated_at
json.url customer_url(customer, format: :json)
