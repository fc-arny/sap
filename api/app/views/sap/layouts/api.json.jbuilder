json.status @status || (@errors ? :fail : :success)
json.errors @errors unless @errors.blank?

# Data
json.data JSON.parse(yield)


