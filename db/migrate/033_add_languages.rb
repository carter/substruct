# Adds table necessary to link uploaded files with products.
#
class AddLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages, :force => true do |t|
      t.string :name
      t.string :iso_abbreviation
      t.boolean :base
      t.timestamps
    end
  end
  
  def self.down
    drop_table :languages
  end

end
