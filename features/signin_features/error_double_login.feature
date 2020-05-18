Feature: I want to see double login error

Background:
  Given I am on the Welcome Page
  
  Given the following users exist:
  | name           | email                   |
  | Akshay Shinde  | ashinde3@binghamton.edu |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 54924198 | 2       | 
  
  And I should see "Log in or Sign up With GitHub"
  When I press "GitHub"
  And I should see "Home"
  
  
@omniauth_test
Scenario: Try to log in again without logging out
  Given I visit the Welcome Page
  And I should see "Log in or Sign up With GitHub"
  When I press "GitHub"
  Then I am on the "Failure Page"
  And I should see "Already Logged In."