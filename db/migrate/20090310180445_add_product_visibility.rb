# Adds table necessary to link uploaded files with products.
#
class AddProductVisibility < ActiveRecord::Migration
  def self.up
    add_column :items, :visibile, :boolean
  end
  
  def self.down
    remove_column :items, :visibile
  end

end
