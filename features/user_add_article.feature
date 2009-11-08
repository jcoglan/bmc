Feature: Users can add articles
  In order to point out some bad science
  As a user
  I want to be able to add links to external articles
  
  Background:
    Given I am logged in
  
  Scenario: Finding the new article page
    Given I am on the home page
    When I follow "Add an article"
    Then I should see "Add an article" within ".main"
  
  Scenario: Adding an article
    Given I am on the new article page
    When I fill in "URL" with "http://www.guardian.co.uk/science/2009/nov/06/cern-big-bang-goes-phut"
    And I press "Submit"
    Then I should see "Edit article: Big bang goes phut as bird drops baguette into Cern machinery"
    When I press "Save"
    Then I should see "Viewing article: Big bang goes phut as bird drops baguette into Cern machinery"

