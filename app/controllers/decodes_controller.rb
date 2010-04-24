class DecodesController < ApplicationController
  # GET /decodes
  # GET /decodes.xml
  def index
    @decodes = Decode.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @decodes }
    end
  end

  # GET /decodes/1
  # GET /decodes/1.xml
  def show
    @decode = Decode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @decode }
    end
  end

  # GET /decodes/new
  # GET /decodes/new.xml
  def new
    @decode = Decode.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @decode }
    end
  end

  # GET /decodes/1/edit
  def edit
    @decode = Decode.find(params[:id])
  end

  # POST /decodes
  # POST /decodes.xml
  def create
    @decode = Decode.new(params[:decode])

    respond_to do |format|
      if @decode.save
        flash[:notice] = 'Decode was successfully created.'
        format.html { redirect_to(@decode) }
        format.xml  { render :xml => @decode, :status => :created, :location => @decode }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @decode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /decodes/1
  # PUT /decodes/1.xml
  def update
    @decode = Decode.find(params[:id])

    respond_to do |format|
      if @decode.update_attributes(params[:decode])
        flash[:notice] = 'Decode was successfully updated.'
        format.html { redirect_to(@decode) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @decode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /decodes/1
  # DELETE /decodes/1.xml
  def destroy
    @decode = Decode.find(params[:id])
    @decode.destroy

    respond_to do |format|
      format.html { redirect_to(decodes_url) }
      format.xml  { head :ok }
    end
  end
end
