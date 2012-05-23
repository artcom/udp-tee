class OpenDefaultValue < ActiveRecord::Migration
  def up
    change_column :fan_outs, :open, :boolean, :default => true, :null => false
  end

  def self.down
    change_column :fan_outs, :open, :boolean, :default => nil, :null => true
  end
end
