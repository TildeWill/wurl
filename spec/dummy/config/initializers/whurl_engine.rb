WhurlEngine.config do |config|
  config.current_user_method { current_user }
  config.authorize_with(:cancan)
end