class CreateFanOuts < ActiveRecord::Migration
  def change
    create_table :fan_outs do |t|
      t.string :nick
      t.integer :input_id
      t.boolean :open

      t.timestamps
    end
  end
end
