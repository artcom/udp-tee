class JointsController < ApplicationController
  # GET /joints
  # GET /joints.json
  def index
    @joints = Joint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @joints }
    end
  end

  # GET /joints/1
  # GET /joints/1.json
  def show
    @joint = Joint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @joint }
    end
  end

  # GET /joints/new
  # GET /joints/new.json
  def new
    @joint = Joint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @joint }
    end
  end

  # GET /joints/1/edit
  def edit
    @joint = Joint.find(params[:id])
  end

  # POST /joints
  # POST /joints.json
  def create
    @joint = Joint.new(params[:joint])

    respond_to do |format|
      if @joint.save
        format.html { redirect_to @joint, notice: 'Joint was successfully created.' }
        format.json { render json: @joint, status: :created, location: @joint }
      else
        format.html { render action: "new" }
        format.json { render json: @joint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /joints/1
  # PUT /joints/1.json
  def update
    @joint = Joint.find(params[:id])

    respond_to do |format|
      if @joint.update_attributes(params[:joint])
        format.html { redirect_to @joint, notice: 'Joint was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @joint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joints/1
  # DELETE /joints/1.json
  def destroy
    @joint = Joint.find(params[:id])
    @joint.destroy

    respond_to do |format|
      format.html { redirect_to joints_url }
      format.json { head :ok }
    end
  end
end
