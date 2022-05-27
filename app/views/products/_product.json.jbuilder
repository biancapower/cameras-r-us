json.extract! product, :id, :brand_name, :product_name, :product_code, :retail_price, :created_at, :updated_at
json.url product_url(product, format: :json)
