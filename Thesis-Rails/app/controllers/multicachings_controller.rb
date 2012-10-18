class MulticachingsController < ApplicationController
  # GET /multicachings
  # GET /multicachings.xml
  def index
    @multicachings = Multicaching.all
    @multicaching = Multicaching.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @multicachings }
    end
  end

  # GET /multicachings/1
  # GET /multicachings/1.xml
  def show
    @multicaching = Multicaching.find(params[:id])
    $global =  params[:id]
    redirect_to :controller => "geocachings", :action => "index", :id => @multicaching.id
    #respond_to do |format|
     # format.html # show.html.erb
     # format.xml  { render :xml => @multicaching }
    #end
  end

  # GET /multicachings/new
  # GET /multicachings/new.xml
  def new
    @multicaching = Multicaching.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @multicaching }
    end
  end

  # GET /multicachings/1/edit
  def edit
    @multicaching = Multicaching.find(params[:id])
  end

  # POST /multicachings
  # POST /multicachings.xml
  def create
    @multicaching = Multicaching.new(params[:multicaching])

    respond_to do |format|
      if @multicaching.save
        format.html {  redirect_to :action => "index"}
        format.xml  { render :xml => @multicaching, :status => :created, :location => @multicaching }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @multicaching.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /multicachings/1
  # PUT /multicachings/1.xml
  def update
    @multicaching = Multicaching.find(params[:id])

    respond_to do |format|
      if @multicaching.update_attributes(params[:multicaching])
        format.html { redirect_to(@multicaching, :notice => 'Multicaching was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @multicaching.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /multicachings/1
  # DELETE /multicachings/1.xml
  def destroy
    @multicaching = Multicaching.find(params[:id])
    @multicaching.destroy

    respond_to do |format|
      format.html { redirect_to(multicachings_url) }
      format.xml  { head :ok }
    end
  end
end
