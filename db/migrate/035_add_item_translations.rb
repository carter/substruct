# Adds table necessary to link uploaded files with products.
#
class AddItemTranslations < ActiveRecord::Migration
  def self.up
    create_table :item_translations, :force => true do |t|
      t.string :locale, :limit => 8
      t.references :item
      t.string :name
      t.text :description
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :item_translations
  end

end
