Feature: Visitor sign-up
  As a visitor
  I want to sign up
  In order to add articles
  
  Scenario: Finding the sign-up page
    Given I am on the home page
    When I follow "Sign up"
    Then I should see "Sign up" within ".main"
  
  Scenario: Signing up
    Given I am on the sign-up page
    When I fill in the following:
      | Username          | jcoglan       |
      | Password          | Frabjous_day  |
      | Confirm password  | Frabjous_day  |
    And I press "Sign up"
    Then I should be on the home page
    And I should see "Welcome, jcoglan!"
  
  Scenario: Signing up with a blank username produces an error
    Given I am on the sign-up page
    When I fill in the following:
      | Username          |               |
      | Password          | Frabjous_day  |
      | Confirm password  | Frabjous_day  |
    And I press "Sign up"
    And I should see "Username can't be blank"
  
  Scenario: Signing up with an invalid username produces an error
    Given I am on the sign-up page
    When I fill in the following:
      | Username          | Has spaces!   |
      | Password          | Frabjous_day  |
      | Confirm password  | Frabjous_day  |
    And I press "Sign up"
    And I should see "Username may only contain letters, numbers and underscores"
  
  Scenario: Signing up without confirming my password produces an error
    Given I am on the sign-up page
    When I fill in the following:
      | Username          | jcoglan       |
      | Password          | Frabjous_day  |
      | Confirm password  | Calloo_callay |
    And I press "Sign up"
    And I should see "Password doesn't match confirmation"
 
