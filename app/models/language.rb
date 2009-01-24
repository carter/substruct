class Language < ActiveRecord::Base
  
  def language_definition_filename(modes='r')
    File.join(RAILS_ROOT, "config", "locales", "#{iso_abbreviation}.yml")
  end
  
  def language_definition
    @language_definition = String.new
    
    # setup the language file... if the iso abbreviation doesn't exist
    # or the file doesn't exist use the default english one
    unless (iso_abbreviation.blank? || !File.exists?(language_definition_filename))
      @language_definition_file = File.new(language_definition_filename)
    else
      @language_definition_file = File.new(filename = File.join(RAILS_ROOT, "config", "locales", "en.yml"))
    end
    
    @language_definition_file.each do |line|
      @language_definition << line
    end
    
    @language_definition_file.close
  
    return @language_definition
  end
  
  def language_definition=(value)
    # here we're writing to the actual language.yml file regardless if 
    # it exists
    @language_definition_file = File.new(language_definition_filename, 'w')
    value.each_line do |line|
      @language_definition_file << line
    end
    @language_definition_file.close
  end
end