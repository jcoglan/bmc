Feature: User logging in
  As a user
  I want to log in so that I can add content
  
  Background:
    Given there is a User "jcoglan" with password "bugle"
  
  Scenario: Logging in
    Given I am on the home page
    And I follow "Log in"
    When I fill in the following:
      | Username | jcoglan |
      | Password | bugle   |
    And I press "Log in"
    Then I should be on the home page
    And I should see "Logged in as jcoglan" within ".navigation"
  
  Scenario Outline: Login fails when incorrect credentials are used
    Given I am on the login page
    When I fill in the following:
      | Username | <username> |
      | Password | <password> |
    And I press "Log in"
    Then I should be on the login page
    And I should see "<error>" within ".error"
    Examples:
      | username  | password  | error                   |
      | nonesuch  | something | Unknown user 'nonesuch' |
      | jcoglan   | notright  | Incorrect password      |
  
  Scenario: Logging out
    Given I am logged in as "some_user"
    And I am on the home page
    When I press "Log out"
    Then I should be on the home page
    And I should see "Log in" within ".navigation"

