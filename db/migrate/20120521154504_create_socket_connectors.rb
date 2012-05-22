class CreateSocketConnectors < ActiveRecord::Migration
  def change
    create_table :socket_connectors do |t|
      t.string :nick
      t.string :ip
      t.integer :port, :null => false

      t.timestamps
    end

    create_table :fan_outs_socket_connectors, :id => false do |t|
      t.integer :fan_out_id
      t.integer :socket_connector_id
    end
  end
end
