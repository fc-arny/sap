response_jsend json do

  # Additional information
  json.count  @count
  json.limit  @limit
  json.offset @offset

  # Goods
  json.goodItems @goods do |good|
    good.decorate.list_set(json)
  end
end