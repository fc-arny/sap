json.result do
  json.(@order, :id, :state, :address, :phone)
  json.items @order.items do |item|
    json.partial! 'sap/api/common/good_item', good_item: item.good_item
    json.(item, :value)
  end
end
