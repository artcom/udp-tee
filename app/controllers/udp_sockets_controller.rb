class UdpSocketsController < ApplicationController
  # GET /udp_sockets
  # GET /udp_sockets.json
  def index
    @udp_sockets = UdpSocket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @udp_sockets }
    end
  end

  # GET /udp_sockets/1
  # GET /udp_sockets/1.json
  def show
    @udp_socket = UdpSocket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @udp_socket }
    end
  end

  # GET /udp_sockets/new
  # GET /udp_sockets/new.json
  def new
    @udp_socket = UdpSocket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @udp_socket }
    end
  end

  # GET /udp_sockets/1/edit
  def edit
    @udp_socket = UdpSocket.find(params[:id])
  end

  # POST /udp_sockets
  # POST /udp_sockets.json
  def create
    @udp_socket = UdpSocket.new(params[:udp_socket])

    respond_to do |format|
      if @udp_socket.save
        format.html { redirect_to @udp_socket, notice: 'Udp socket was successfully created.' }
        format.json { render json: @udp_socket, status: :created, location: @udp_socket }
      else
        format.html { render action: "new" }
        format.json { render json: @udp_socket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /udp_sockets/1
  # PUT /udp_sockets/1.json
  def update
    @udp_socket = UdpSocket.find(params[:id])

    respond_to do |format|
      if @udp_socket.update_attributes(params[:udp_socket])
        format.html { redirect_to @udp_socket, notice: 'Udp socket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @udp_socket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /udp_sockets/1
  # DELETE /udp_sockets/1.json
  def destroy
    @udp_socket = UdpSocket.find(params[:id])
    @udp_socket.destroy

    respond_to do |format|
      format.html { redirect_to udp_sockets_url }
      format.json { head :no_content }
    end
  end
end
