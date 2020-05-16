Feature:
    As a User
    I want to successfully login in given valid EmailId and Password
    So I can see the Events Page
    
Background: on EventNest Homepage
  Given I am on the EventNest homepage
  
Scenario: See Login Page
    Then I should see "Welcome to BU EventNest"
    And I should see "Log in"
    And I should see "Signup or Log In With GitHub"

  
Scenario: Successfully Log in
    When I am on Events
    Then I should see "Upcoming Events" 
    And I should see "RSVP"
    And I should see "Your Events"

