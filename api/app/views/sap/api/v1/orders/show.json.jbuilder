json.result do
  json.(@order, :id, :state, :address, :phone)
  json.items @order.items do |item|
    json.(item, :gid, :current_price, :value)
  end
end
