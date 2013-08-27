# Additional information
json.count  @count
json.limit  @limit
json.offset @offset

# Goods
json.goodItems @goods do |good|
  json.array!(json.goodItems good.decorate.list_set)
end



#json.goodItems do
#
#  json.child! { json.art 'art-val' }
#
#  #@goods.each do |good|
#  #
#  #end
#end
#json.goodItems @goods do |good|
#  json.child! do
#    good.decorate.list_set
#  end
#end


# TODO: Add images, formats (base64 or link)
