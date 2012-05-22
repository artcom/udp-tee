class CreateSocketConnectors < ActiveRecord::Migration
  def change
    create_table :socket_connectors do |t|
      t.string :nick
      t.string :ip
      t.integer :port, :null => false

      t.timestamps
    end
  end
end
