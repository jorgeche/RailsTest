class User < ActiveRecord::Base
  
  validates_presence_of   :username
  validates_uniqueness_of :username 
  
  validates_presence_of   :firstname
  validates_presence_of   :lastname
  
  # If a user matching the credentials is found, returns the User object.
  # If no matching user is found, returns nil.
  def self.authenticate(user_info)
    find_by_username(user_info[:username])
  end 
  
  def self.findByUsername(username)
    find_by_username(username)
  end 
  
  def self.findById(id)
    find_by_id(id)
  end
end
