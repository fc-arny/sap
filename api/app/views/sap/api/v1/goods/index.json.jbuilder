response_jsend json do

  json.goods @goods do |good|
    good.decorate.index_set(json)
  end

end