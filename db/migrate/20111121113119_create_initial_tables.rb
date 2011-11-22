class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :fan_outs do |t|
      t.string  :nick
      t.integer :input_id
      t.boolean :open

      t.timestamps
    end

    create_table :inputs do |t|
      t.string  :nick
      t.integer :fan_out_id

      t.string  :ip
      t.integer :port
      t.boolean :open

      t.timestamps
    end

    create_table :outputs do |t|
      t.string  :nick
      t.integer :fan_out_id

      t.string  :ip
      t.integer :port
      t.boolean :open

      t.timestamps
    end
  end
end
