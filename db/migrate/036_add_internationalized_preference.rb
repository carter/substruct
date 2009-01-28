
class AddInternationalizedPreference < ActiveRecord::Migration
  def self.up
    Preference.create(:name => 'internationalization', :value => false)
  end
  
  def self.down
    Preference.find_by_name('internationalization').destroy
  end

end
