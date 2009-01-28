# default
i18n = Preference.find_by_name('internationalization').is_true? ? ':locale' : ''

if i18n == ':locale'
  connect "/",
    :controller => 'content_nodes', 
    :action => "show_by_name",
    :name => "home"
end

connect "/#{i18n}",
  :controller => 'content_nodes',
  :action     => 'show_by_name',
  :name       => 'home'

connect "#{i18n}",
  :controller => 'content_nodes',
  :action     => 'show_by_name',
  :name       => 'home'

# Default administration mapping
connect "#{i18n}/admin",
  :controller => 'admin/orders',
  :action     => 'index'

connect "#{i18n}/blog",
  :controller => 'content_nodes',
  :action     => 'index'

connect "#{i18n}/blog/section/:section_name",
  :controller => 'content_nodes',
  :action     => 'list_by_section'

# Static route blog content through our content_node controller
connect "#{i18n}/blog/:name",
  :controller => 'content_nodes',
  :action     => 'show_by_name'


connect "#{i18n}/contact",
  :controller => 'questions',
  :action     => 'ask'

connect "#{i18n}/store/show_by_tags/*tags",
  :controller => 'store',
  :action     => 'show_by_tags'

# Install the default route as the lowest priority.
connect "#{i18n}/:controller/:action/:id.:format"
connect "#{i18n}/:controller/:action/:id"

# For things like /about_us, etc
connect "#{i18n}/:name",
  :controller => 'content_nodes',
  :action     => 'show_by_name'