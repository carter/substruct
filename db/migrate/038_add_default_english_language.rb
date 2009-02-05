# Adds table necessary to link uploaded files with products.
#
class AddDefaultEnglishLanguage < ActiveRecord::Migration
  def self.up
    Language.create(:name => 'English', :iso_abbreviation => 'en')
  end
  
  def self.down
    Language.find_by_iso_abbreviation('en').destroy
  end

end
