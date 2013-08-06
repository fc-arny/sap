response_jsend json do

  json.goodItems @goods do |good|
    good.decorate.list_set(json)
  end

end