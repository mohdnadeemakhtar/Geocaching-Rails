class GeocachingsController < ApplicationController
  # GET /geocachings
  # GET /geocachings.xml
  

  def index
    @multicaching_current  = Integer($global)
    @geocachings = Geocaching.find(:all,:order => "position", :conditions => {:multicaching_id => @multicaching_current })
    @json = Geocaching.find(:all,:order => "position", :conditions => {:multicaching_id => @multicaching_current }).to_gmaps4rails do |geocaching,marker|
      marker.json "\"id\" : \"#{geocaching.id}//#{geocaching.position}//#{geocaching.name}\""
    end
    #@json =Geocaching.find_all_by_multicaching_id(@multicaching_current).to_gmaps4rails
 
    @polylines = '['+ @json+']'
    @waypoints = Geocaching.find(:all  , :order => "position", :conditions => {:multicaching_id => @multicaching_current })
    @multicache =Multicaching.find(@multicaching_current)
    @geocaching = Geocaching.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json=> @geocachings }
    end
  end

  # GET /geocachings/1
  # GET /geocachings/1.xml
  def show
    @geocaching = Geocaching.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @geocaching }
    end
  end

  # GET /geocachings/new
  # GET /geocachings/new.xml
  def new

    @multicaching_current  = Integer($global)
    @geocaching = Geocaching.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json=> @geocaching }
    end
  end

  # GET /geocachings/1/edit
  def edit
    @multicaching_current  = Integer($global)
    @geocaching = Geocaching.find(params[:id])
  end

  # POST /geocachings
  # POST /geocachings.xml
  def create
    @multicaching_current  = Integer($global)
    @geocaching = Geocaching.new(params[:geocaching])
    @geocachings = Geocaching.find(:all, :conditions => {:multicaching_id => @multicaching_current })
    @int =     @geocaching[:position] +1
    respond_to do |format|
      if @geocaching.save
        if(@geocaching[:checker]=="Before")
          Geocaching.where(:multicaching_id => @multicaching_current ).update_all("position = position + 100", ["position >= ?",@geocaching[:position] + 1], :order => "position")
          puts "Before is coming----------------------------------"
        else if(@geocaching[:checker]=="After")
            puts "after is coming------------------------------- #{@geocaching[:position]-1}"
            Geocaching.where(:multicaching_id => @multicaching_current ).update_all("position = position + 100", ["position > ?",@geocaching[:position]-1], :order => "position")
        
          end
        end
        format.html  { redirect_to geocachings_url}
        format.json { render :json => @geocaching, :status => :created, :location => @geocaching }
      else
        format.html { render :action => "new" }
        format.json { render :json => @geocaching.errors, :status =>:unprocessable_entity }
      end
    end
  end

  # PUT /geocachings/1
  # PUT /geocachings/1.xml
  def update
    @multicaching_current  = Integer($global)
    @geocaching = Geocaching.find(params[:id])

    respond_to do |format|
      if @geocaching.update_attributes(params[:geocaching])
        format.html { redirect_to(@geocaching, :notice => 'Geocaching was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json =>@geocaching.errors, :status =>:unprocessable_entity }
      end
    end
  end

  # DELETE /geocachings/1
  # DELETE /geocachings/1.xml
  def destroy
    @geocaching = Geocaching.find(params[:id])
    @geocaching.destroy

    respond_to do |format|
      format.html { redirect_to(geocachings_url) }
      format.json { head :ok }
    end
  end

  def generate_xml_file
    @multicaching_current  = Integer($global)
    @project_name = Multicaching.find_by_id(@multicaching_current)
    @elements = Geocaching.find_all_by_multicaching_id(@multicaching_current)
    #    @geocachings = Geocaching.find(:all,:order => "id", :conditions => {:multicaching_id => @multicaching_current })
    #    puts  @geocachings = Geocaching.find(:all,:order => "id", :conditions => {:multicaching_id => @multicaching_current }).to_xml(:only =>[:latitude,:longitude])

    doc = REXML::Document.new
    root = doc.add_element(@project_name.name)
    @elements.each { |element_data|
      geocaching_element = root.add_element("geocaching")
      geocaching_element.add_attribute("latitude",element_data[:latitude])
      geocaching_element.add_attribute("longitude",element_data[:longitude])
      introduction_element = geocaching_element.add_element("summary")
      introduction_element.add_text(element_data[:summary])

    }
    doc.write(out_string ="", 2)
    flash[:notice] = "On Request xml-File is Created..!!"
    respond_to do |format|
      format.html { redirect_to geocachings_url }
      format.json { head :ok }
    end
    puts  "Its Coming......nademm.........>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + out_string

    return out_string

  end
end
