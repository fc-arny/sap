# Additional information
json.count  @count
json.limit  @limit
json.offset @offset

# Goods
json.goodItems @goods do |good|
  good.decorate.list_set.call(json)
end


# TODO: Add images, formats (base64 or link)
