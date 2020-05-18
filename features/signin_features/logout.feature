Feature: 
  As a user
  I want to successfully logout 

Background:
  #Given I am on the "Home"
  
  Given the following users exist:
  | name           | email                   |
  | Akshay Shinde  | ashinde3@binghamton.edu |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 54924198 | 2       |
  
@omniauth_test
Scenario: Log out
  Given I visit the "Home"
  # And I should see "Log Out"
  When I follow "Log Out"
  Then I should see "You successfully logged out of your account."
  And I am on the "Welcome Page"