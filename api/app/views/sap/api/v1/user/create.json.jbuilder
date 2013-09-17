if @status == :fail
  json.errors @errors
else
  json.name         @user.name
  json.login        @user.login
  json.auth_token   @user.authentication_token
  json.is_temporary @user.is_temporary
end