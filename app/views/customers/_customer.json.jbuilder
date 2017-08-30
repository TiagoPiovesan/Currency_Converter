json.extract! customer, :id, :name, :email, :cpf, :sex, :birth, :created_at, :updated_at
json.url customer_url(customer, format: :json)
