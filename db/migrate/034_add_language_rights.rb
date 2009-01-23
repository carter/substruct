class AddLanguageRights < ActiveRecord::Migration
  def self.up
		
		# Add permissions for admins to edit prefs
		puts 'Creating Language rights'
		right = Right.create(
			[ 
				{ :name => 'Languages - Admin', :controller => 'languages', :actions => '*' }
			]
		)
		puts 'Assigning rights to Admin role...'
		admin_role = Role.find_by_name('Administrator')
		admin_role.rights << right
  end

  def self.down
  

		puts 'Removing promotion rights'
		rights = Right.find(:all, :conditions => "name LIKE 'Language%'")
		for right in rights
		  right.destroy
	  end
  end
end