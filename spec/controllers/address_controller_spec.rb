require 'spec_helper'

describe AddressesController do
  #integrate_views

  describe "GET 'addresses index'" do
    it "should be successful" do
      @user = User.findByUsername("user_1")
      
      session[:user] = @user
      get :index
      response.should be_success
    end
  end
  
  describe "GET 'new'" do
    it "should be successful" do
      
      @user = User.findByUsername("user_1")
      
      session[:user] = @user
      get :new
      response.should be_success
    end
  end

  describe "add address" do
    
    it "should be successful" do
      @user = User.findByUsername("user_1")
      session[:user] = @user
      assert_difference('Address.count') do
            post :create, :address => {:users_id => 1,  
                                    :address => "user_1@domain.com", 
                                    :encrypted_password => "encrypted_password"}
      end
    end
  end

  
  describe "delete address" do
    
    it "should delete address" do
      
      @user = User.findByUsername("user_1")
      session[:user] = @user
      assert_difference('Address.count', -1) do
        post :destroy, :id => 1
      end
    end
  end
  
  describe "update address" do
    
    it "should update address" do
    
      @user = User.findByUsername("user_1")
      session[:user] = @user
      post :update, :id => 1, :address => {:address => "user_1_modified@domain.com", :encrypted_password => "encrypted_password"}
      assert_redirected_to(:controller => :addresses, :user => 1)
    end
  end 
end
