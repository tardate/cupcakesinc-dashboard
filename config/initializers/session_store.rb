# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_awdemo-warehouse_session',
  :secret      => '7a4264acc6a211f2655537fbd2ba7bf42357b7465025e8819f6893b6fdda0b2cf78c88595c08ad9b2902fee24b95d96541dabf6b3040d41422c3ff0e8f62bbb1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
