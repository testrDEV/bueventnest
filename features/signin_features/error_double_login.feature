Feature: I want to see double login error

Background:
  Given I am on the EventNest homepage
  
  Given the following users exist:
  | name           | email                   |
  | Akshay Shinde  | ashinde3@binghamton.edu |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 54924198 | 2       | 
  
  When I Log in or Sign up With "GitHub"
  Then I am on the "Home Page"
  
@omniauth_test
Scenario: Try to log in again without logging out
  Given I visit the "EventNest Page"
  When I Log in or Sign up With "GitHub"
  Then I am on the "Failure Page"
  And I should see "Login inside a Login, is this inception? You're already logged in"