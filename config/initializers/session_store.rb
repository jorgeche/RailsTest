# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_RailsTest_session',
  :secret      => 'd629d6781fd50a3270a6caae7c27242452c09abae3a2eb3f2e89f5731f9c88cd698d178b55986caedc43fcbb895401cbd0b26ea102a0fb59dac1bd70019a9775'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
