Feature: Visitor sign-up
  As a visitor
  I want to sign up
  In order to add articles
  
  Scenario: Finding the sign-up page
    Given I am on the home page
    When I follow "Sign up"
    Then I should see "Sign up" within ".main"
 
