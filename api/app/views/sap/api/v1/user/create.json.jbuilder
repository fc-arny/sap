if @status == :fail
  json.errors @errors
else
  json.auth_token @user.authentication_token
  json.login @user.login
end