# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bmc_session',
  :secret      => 'ddf29d9dedf13bc1fc535a46a26a6983d9440d937ccaa9496611d763f9c66e08ffb7ccd501f7250f7d5e3d49a667184d71d9798cc78bbed9901703c8a20a1d6f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
