json.status @status || (@errors ? :fail : :success)
json.errors @errors if @errors

# Data
json.data JSON.parse(yield)


