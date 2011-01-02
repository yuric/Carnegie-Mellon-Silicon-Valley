class AirlinesController < ApplicationController
  before_filter:authenticate_user!    # uncomment to lock intere site
  
  # GET /airlines
  # GET /airlines.xml
  def index
    @airlines = Airline.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @airlines }
    end
  end

  # GET /airlines/1
  # GET /airlines/1.xml
  def show
    @airline = Airline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @airline }
    end
  end

  # GET /airlines/new
  # GET /airlines/new.xml
  def new
    @airline = Airline.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @airline }
    end
  end

  # GET /airlines/1/edit
  def edit
    @airline = Airline.find(params[:id])
  end

  # POST /airlines
  # POST /airlines.xml
  def create
    @airline = Airline.new(params[:airline])

    respond_to do |format|
      if @airline.save
        format.html { redirect_to(@airline, :notice => 'Travel form was successfully created.') }
        format.xml  { render :xml => @airline, :status => :created, :location => @airline }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @airline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /airlines/1
  # PUT /airlines/1.xml
  def update
    @airline = Airline.find(params[:id])

    respond_to do |format|
      if @airline.update_attributes(params[:airline])
        format.html { redirect_to(@airline, :notice => 'Travel form was successfully created.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @airline.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /airlines/1
  # DELETE /airlines/1.xml
  def destroy
    @airline = Airline.find(params[:id])
    @airline.destroy

    respond_to do |format|
      format.html { redirect_to(airlines_url) }
      format.xml  { head :ok }
    end
  end
end
