class FanOutsController < ApplicationController
  # GET /fan_outs
  # GET /fan_outs.json
  def index
    @fan_outs = FanOut.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fan_outs }
    end
  end

  # GET /fan_outs/1
  # GET /fan_outs/1.json
  def show
    @fan_out = FanOut.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fan_out }
    end
  end

  # GET /fan_outs/new
  # GET /fan_outs/new.json
  def new
    @fan_out = FanOut.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fan_out }
    end
  end

  # GET /fan_outs/1/edit
  def edit
    @fan_out = FanOut.find(params[:id])
  end

  # POST /fan_outs
  # POST /fan_outs.json
  def create
    @fan_out = FanOut.new(params[:fan_out])

    respond_to do |format|
      if @fan_out.save
        format.html { redirect_to @fan_out, notice: 'Fan out was successfully created.' }
        format.json { render json: @fan_out, status: :created, location: @fan_out }
      else
        format.html { render action: "new" }
        format.json { render json: @fan_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fan_outs/1
  # PUT /fan_outs/1.json
  def update
    @fan_out = FanOut.find(params[:id])

    respond_to do |format|
      if @fan_out.update_attributes(params[:fan_out])
        format.html { redirect_to @fan_out, notice: 'Fan out was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fan_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fan_outs/1
  # DELETE /fan_outs/1.json
  def destroy
    @fan_out = FanOut.find(params[:id])
    @fan_out.destroy

    respond_to do |format|
      format.html { redirect_to fan_outs_url }
      format.json { head :ok }
    end
  end
end
