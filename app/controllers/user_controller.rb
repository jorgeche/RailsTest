class UserController < ApplicationController
  
  #before_filter :login_required, :only => :addresses
  
  def login
    @user = User.new
    @user.username = params[:username]
  end

  def begin_login_process
    if user = User.findByUsername(params[:user][:username])
      redirect_to :action => 'authentication', :username => user[:username], :encrypted_username => user[:encrypted_username]
    else
      flash[:error] = 'Invalid login.'
      redirect_to :action => 'login', :username => params[:user][:username]
    end
  end
  
  def authentication
    
  end

  def end_login_process
    if params[:username] == params[:decrypted_username] && @user = User.findByUsername(params[:username])
      session[:user] = @user # Remember the user's id during this session
      redirect_to(:user => @user, :controller => :addresses)
    else
      flash[:error] = 'Invalid login.'
      redirect_to :action => 'login', :username => params[:username]
    end
  end
  
  def logout
    reset_session
    flash[:message] = 'Logged out.'
    redirect_to :action => 'login'
  end


#  def show
#    @user = User.findById(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @user }
#    end
#  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    if @user.save
      session[:user] = @user # Remember the user's id during this session
      redirect_to(:user => @user, :controller => :addresses)
    else
      respond_to do |format|
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
