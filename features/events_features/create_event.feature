Feature: 
  As a user
  I want to successfully create an event

Background:
  Given I am on the "Create Event Page"
  
  Given the following users exist:
  | name           | email                   |
  | Akshay Shinde  | ashinde3@binghamton.edu |
  
  Given the following authorizations exist:
  | provider | uid      | user_id |
  | github   | 54924198 | 2       |

@omniauth_test
Scenario: Create an event
  Given I am on the "Create Event Page"
  And I should see "Create Event"
  When I fill in "name" with "HackBU"
  And I fill in "description" with "Come learn about HackBU and the various activities we will be doing."
  And I fill in "location" with "Binghamton"
  And I fill in "contact" with "123456"
  And I fill in "number of seats" with "4"
  When I press "Save"
  Then I should be on the "Events Page"
  And I should see "You successfully created HackBU."
  
  