#Given /I am on eventnest homepage/ do 
    
#end

#Then('I should see {string} button') do |string|
#end

#Then /I should see "(.*)"/ do |e1|
 #   expect(page.body).to match (/(Upcoming Events)/) 
    
#end 

Given(/^I Log in or Sign up With "([^"]*)"$/) do |provider|
  visit "/auth/#{provider.downcase}"
end


Given(/the following users exist/) do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end
  
Given (/the following authorizations exist/) do |authorizations_table|
  authorizations_table.hashes.each do |authorization|
    Authorization.create!(authorization) 
  end
end