if @status == :fail
  json.array!(json.data @errors)
else
end