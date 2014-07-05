unless @status == :fail
  json.name         @user.name
  json.login        @user.login
  json.auth_token   @user.authentication_token
  json.is_temporary @user.is_temporary
end