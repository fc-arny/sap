json.categories @categories do |category|
  json.array!(json.categories category.decorate.index_set)
end