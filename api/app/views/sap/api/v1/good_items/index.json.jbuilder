# Additional information
json.count  @meta[:count]
json.limit  @meta[:limit]
json.offset @meta[:offset]

json.result @goods do |good_item|
  json.(good_item, :id, :price, :store_id)

  # Good fields
  json.good do
    json.(good_item.good, :id, :name, :description, :value)
  end

  json.ordered @ordered[good_item.id], :order_id, :value, :price unless @ordered[good_item.id].blank?
end

# TODO: Add images, formats (base64 or link)
