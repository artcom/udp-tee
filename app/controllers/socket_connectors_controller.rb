class SocketConnectorsController < ApplicationController
  # GET /socket_connectors
  # GET /socket_connectors.json
  def index
    @socket_connectors = SocketConnector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @socket_connectors }
    end
  end

  # GET /socket_connectors/1
  # GET /socket_connectors/1.json
  def show
    @socket_connector = SocketConnector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @socket_connector }
    end
  end

  # GET /socket_connectors/new
  # GET /socket_connectors/new.json
  def new
    @socket_connector = SocketConnector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @socket_connector }
    end
  end

  # GET /socket_connectors/1/edit
  def edit
    @socket_connector = SocketConnector.find(params[:id])
  end

  # POST /socket_connectors
  # POST /socket_connectors.json
  def create
    @socket_connector = SocketConnector.new(params[:socket_connector])

    respond_to do |format|
      if @socket_connector.save
        format.html { redirect_to @socket_connector, notice: 'Udp socket was successfully created.' }
        format.json { render json: @socket_connector, status: :created, location: @socket_connector }
      else
        format.html { render action: "new" }
        format.json { render json: @socket_connector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /socket_connectors/1
  # PUT /socket_connectors/1.json
  def update
    @socket_connector = SocketConnector.find(params[:id])

    respond_to do |format|
      if @socket_connector.update_attributes(params[:socket_connector])
        format.html { redirect_to @socket_connector, notice: 'Udp socket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @socket_connector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socket_connectors/1
  # DELETE /socket_connectors/1.json
  def destroy
    @socket_connector = SocketConnector.find(params[:id])
    @socket_connector.destroy

    respond_to do |format|
      format.html { redirect_to socket_connectors_url }
      format.json { head :no_content }
    end
  end
end
