class OutputsController < ApplicationController
  # GET /outputs
  # GET /outputs.json
  def index
    @outputs = Output.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outputs }
    end
  end

  # GET /outputs/1
  # GET /outputs/1.json
  def show
    @output = Output.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @output }
    end
  end

  # GET /outputs/new
  # GET /outputs/new.json
  def new
    @output = Output.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @output }
    end
  end

  # GET /outputs/1/edit
  def edit
    @output = Output.find(params[:id])
  end

  # POST /outputs
  # POST /outputs.json
  def create
    @output = Output.new(params[:output])

    respond_to do |format|
      if @output.save
        format.html { redirect_to @output, notice: 'Output was successfully created.' }
        format.json { render json: @output, status: :created, location: @output }
      else
        format.html { render action: "new" }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outputs/1
  # PUT /outputs/1.json
  def update
    @output = Output.find(params[:id])

    respond_to do |format|
      if @output.update_attributes(params[:output])
        format.html { redirect_to @output, notice: 'Output was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outputs/1
  # DELETE /outputs/1.json
  def destroy
    @output = Output.find(params[:id])
    @output.destroy

    respond_to do |format|
      format.html { redirect_to outputs_url }
      format.json { head :ok }
    end
  end
end
