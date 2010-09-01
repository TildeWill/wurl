# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_whurl_session',
  :secret      => '2512358a1b3a68158cafdd4dd7dc1a8f33bdb07814a10dbd4845f61696d61dd862183a75b362b487ea378105e6ad74ccc58011f44511a5eeca291bde08ab199a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
