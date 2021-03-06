class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.xml
  before_filter :login_required
  
  def index
    @addresses = Address.findByUser(session[:user][:id])

    respond_to do |format|
      #format.html {redirect_to(@addresses, :notice => session[:user][:id])}# index.html.erb
      format.html # index.html.erb
      format.xml  { render :xml => @addresses }
    end
  end
  
  # GET /addresses/1
  # GET /addresses/1.xml
  def show
    :index
=begin
    @address = Address.find(params[:user][:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @address }
    end
=end
  end

  # GET /addresses/new
  # GET /addresses/new.xml
  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.xml
  def create
    @address = Address.new(params[:address])

   # respond_to do |format|
      if @address.save
        @user = session[:user]
        redirect_to(:user => @user, :controller => :addresses)
        #format.html { redirect_to(@address, :notice => 'Address was successfully created.') }
        #format.xml  { render :xml => @address, :status => :created, :location => @address }
      else
        respond_to do |format|
          format.html { render :action => "new" }
          format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
        end
      end
  end

  # PUT /addresses/1
  # PUT /addresses/1.xml
  def update
    @address = Address.find(params[:id])

    #respond_to do |format|
      if @address.update_attributes(params[:address])
        @user = session[:user]
        redirect_to(:user => @user, :controller => :addresses)
        #format.html { redirect_to(@address, :notice => 'Address was successfully updated.') }
        #format.xml  { head :ok }
      else
        respond_to do |format|
          format.html { render :action => "edit" }
          format.xml  { render :xml => @address.errors, :status => :unprocessable_entity }
        end
      end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.xml
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to(addresses_url) }
      format.xml  { head :ok }
    end
  end
end
