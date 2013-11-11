unless @errors && @errors.empty?
  json.errors @errors
else
  json.auth_token @user.authentication_token
  json.login @user.login
end