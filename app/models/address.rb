class Address < ActiveRecord::Base
 
  #attr_readonly :id
  #attr_readonly :username
  #attr_readonly :address

  validates_presence_of   :users_id
  validates_presence_of   :address
  validates_presence_of   :encrypted_password
  
  def self.findByUser(user_id)
    find_all_by_users_id(user_id)
  end
end
