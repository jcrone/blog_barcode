json.extract! inventory, :id, :brand, :model, :size, :tag, :category, :price, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
