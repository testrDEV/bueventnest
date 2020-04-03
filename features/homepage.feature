Feature: Homepage for EventNest
  
  As a binghamton.edu user
  I want to access the Homepage
  So I can View/create an event

Background: on EventNest Homepage

  Given I am on the EventNest homepage

Scenario:
  Then I should see "Login" 
  And I should see "Signup" 
  And I should see "Upcoming Events"