Feature: 
  As a user
  I want to successfully login using valid EmailId and Password

Background:
  Given I am on the Welcome Page
  
  Given the following users exist:
  | name           | email                   |
  | Akshay Shinde  | ashinde3@binghamton.edu |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 54924198 | 2       |
  
  
  
@omniauth_test
Scenario: Log in
  And I should see "Log in or Sign up With GitHub"
  When I press "GitHub"
  And I should see "Home"
  