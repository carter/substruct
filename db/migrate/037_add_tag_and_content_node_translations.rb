# Adds table necessary to link uploaded files with products.
#
class AddTagAndContentNodeTranslations < ActiveRecord::Migration
  def self.up
    create_table :tag_translations, :force => true do |t|
      t.string :locale, :limit => 8
      t.references :tag
      t.string :name
      
      t.timestamps
    end
    
    create_table :content_node_translations, :force => true do |t|
      t.string :locale, :limit => 8
      t.references :content_node
      t.string :title
      t.text :content
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tag_translations
    drop_table :content_node_translations
  end

end
