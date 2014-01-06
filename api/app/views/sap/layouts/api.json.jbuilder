# JSEND format response
json.status @status || (@errors ? :fail : :success)
#json.message @message || nil
json.errors @errors if @errors

# Data
json.data JSON.parse(yield)


