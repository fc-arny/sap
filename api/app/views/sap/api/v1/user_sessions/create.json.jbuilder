if @status == :success
  json.auth_token @user.authentication_token
  json.login @user.login
end