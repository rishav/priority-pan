# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_priority-pan_session',
  :secret      => 'c012ab58042b5d0d8c8013bebb99d2de1ed66a324b921729f33e1dfeb744f619853c2b1c1533dce01449575b6a37fdb324da9d48635122c607f5701ee546a0b6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
