class CreateUdpSockets < ActiveRecord::Migration
  def change
    create_table :udp_sockets do |t|
      t.string :nick
      t.string :ip
      t.integer :port, :null => false

      t.timestamps
    end
  end
end
