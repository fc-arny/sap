# JSEND format response
json.status @status || :success
json.message @message || nil

# Data
json.data JSON.parse(yield)


