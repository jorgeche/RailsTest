require 'spec_helper'

describe UserController do
  #integrate_views

  describe "GET 'index'" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'login'" do
    it "should be successful" do
      get :login
      response.should be_success
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
  end

  describe "add user" do
    
    it "should add 5 users" do
    
      username = "user_"
      
      for counter in 1..5
        assert_difference('User.count') do
          post :create, :user => {:username => username + counter.to_s(),  
                                  :encrypted_username => "encrypted_" + username + counter.to_s(), 
                                  :firstname => username + counter.to_s()  + "_firstname",
                                  :lastname => username + counter.to_s()  + "_lastname"}
        end
        
        get :new
        response.should be_success
      end
    end

    it "should log a user" do

      post :end_login_process, :username => "user_1", :decrypted_username => "user_1"
    
      assert_redirected_to(:controller => :addresses, :user => 1)
      
    end
  end
  
  describe "delete user" do
    
    it "should delete user_2" do
    
        post :destroy, :id => 2
    end
  end
end
