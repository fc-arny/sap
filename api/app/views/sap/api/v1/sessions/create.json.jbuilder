unless [:fail, :error].include? @status
  json.auth_token @user.authentication_token
  json.login @user.login
end