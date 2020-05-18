Given(/^I Log in or Sign up With "([^"]*)"$/) do |provider|
  visit "/auth/#{provider.downcase}"
end

Given(/^I visit (.+)$/) do |page_name|
  visit path_to(page_name)
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

Then(/(.*) seed users should exist/) do | n_seeds |
  User.count.should be n_seeds.to_i
end

Then(/(.*) seed authorizations should exist/) do | n_seeds |
  Authorization.count.should be n_seeds.to_i
end

Given(/the following events exist/) do |events_table|
  events_table.hashes.each do |event|
    Event.create!(event)
  end
end