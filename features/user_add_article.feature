Feature: Users can add articles
  In order to point out some bad science
  As a user
  I want to be able to add links to external articles
  
  Background:
    Given I am logged in as "jcoglan"
  
  Scenario: Finding the new article page
    Given I am on the home page
    When I follow "Add an article"
    Then I should see "Add an article" within ".main"
  
  Scenario: Adding an article fetches the title automatically
    Given I am on the new article page
    When I fill in "URL" with "http://www.guardian.co.uk/science/2009/nov/06/cern-big-bang-goes-phut"
    And I press "Submit"
    Then I should see "Edit article: Big bang goes phut as bird drops baguette into Cern machinery"
    When I press "Save"
    Then I should see "Viewing article: Big bang goes phut as bird drops baguette into Cern machinery"
  
  Scenario Outline: Articles are attributed to the user who posted them
    Given there is a User with the username "imrankhan"
    And there is an Article titled "Rails causes cancer"
    And the Article was submitted by "<user>"
    When I visit the page for the Article
    Then I should see "Viewing article: Rails causes cancer"
    And I should see "Posted by <attributee>" within ".attribution"
    Examples:
      | user      | attributee  |
      | jcoglan   | you         |
      | imrankhan | imrankhan   |
