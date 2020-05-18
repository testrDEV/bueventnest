# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    #Given I am on the EventNest homepage
    
      when /^the Welcome Page$/ 
        welcome_login_path
        
      when (/^the "Home"$/) 
        homepage_index_path  
        
      when (/^the "Failure Page"$/) 
        auth_failure_path   
        
      when (/^the "Events Page"$/)
        events_path
        
      when (/^the "Create Event Page"$/)
        new_event_path
        
      when (/^the "Show Events Page"$/)
        events_path
        
      when (/^the "Event Show Page" for "(.*)"$/)
        event_path(Event.find_by_name($1))
        
      when (/^the "rsvp page"$/)
        rsvp_path

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
